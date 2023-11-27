//
//  NetworkSesionManager.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - NetworkSessionManaging

public protocol NetworkSessionManaging {
  func perform(_ request: RequestProtocol) async throws -> Data
}

// MARK: - NetworkSesionManager

public class NetworkSesionManager: NetworkSessionManaging {

  // MARK: Lifecycle

  public init(urlSession: URLSession = URLSession.shared,
              requestBuilder: RequestBuilding = RequestBuilder(),
              logger: NetworkLogging = DefaultNetworkLogger()) {
    self.urlSession = urlSession
    self.requestBuilder = requestBuilder
    self.logger = logger
  }

  // MARK: Public

  public func perform(_ request: RequestProtocol) async throws -> Data {
    if #available(iOS 15.0, *) {
      let urlRequest = try requestBuilder.buildURLRequest(request: request)
      logger.logRequest(urlRequest)

      let (data, response) = try await urlSession.data(for: urlRequest)

      logger.logResponse(response, data: data, error: nil)

      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
      else {
        throw NetworkError.invalidServerResponse
      }
      return data
    } else {
      // Fallback on earlier versions
      fatalError()
    }
  }

  // MARK: Private

  private let urlSession: URLSession
  private let requestBuilder: RequestBuilding
  private let logger: NetworkLogging

}
