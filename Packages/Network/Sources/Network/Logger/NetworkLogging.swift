//
//  NetworkLogger.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - NetworkLogging

public protocol NetworkLogging {
  func logRequest(_ request: URLRequest)
  func logResponse(_ response: URLResponse?, data: Data?, error: Error?)
}

// MARK: - DefaultNetworkLogger

public class DefaultNetworkLogger: NetworkLogging {

  // MARK: Lifecycle

  public init() { }

  // MARK: Public

  public func logRequest(_ request: URLRequest) {
    print("------------ REQUEST START ------------")
    defer { print("------------ REQUEST END ------------\n") }

    print("URL: \(request.url?.absoluteString ?? "Unknown URL")")
    print("Method: \(request.httpMethod ?? "Unknown Method")")

    if let headers = request.allHTTPHeaderFields as? [AnyHashable: Any],
       !headers.isEmpty {
      print("Headers:\n\(headers.jsonString)")
    }

    if let jsonString = request.httpBody?.asJSONString() {
      print("Body:\n\(jsonString)")
    }
  }

  public func logResponse(_ response: URLResponse?, data: Data?, error: Error?) {
    print("------------ RESPONSE START ------------")
    defer { print("------------ RESPONSE END ------------\n") }

    if let httpResponse = response as? HTTPURLResponse {
      print("Status Code: \(httpResponse.statusCode)")
    }

    if let headers = (response as? HTTPURLResponse)?.allHeaderFields as? [AnyHashable: Any],
       !headers.isEmpty {
      print("Headers: \(headers.jsonString)")
    }

    if let jsonString = data?.asJSONString() {
      print("Body:\n\(jsonString)")
    }

    if let error {
      print("Error: \(error.localizedDescription)")
    }
  }
}
