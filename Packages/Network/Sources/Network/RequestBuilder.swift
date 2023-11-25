//
//  RequestBuilder.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - RequestBuilding

public protocol RequestBuilding {
  func buildURLRequest(request: RequestProtocol) throws -> URLRequest
}

// MARK: - RequestBuilder

public struct RequestBuilder: RequestBuilding {

  // MARK: Lifecycle

  public init(urlQueryEncoder: URLQueryEncoding = URLQueryEncoder(),
              jsonBodyEncoder: JSONBodyEncoding = JSONBodyEncoder()) {
    self.urlQueryEncoder = urlQueryEncoder
    self.jsonBodyEncoder = jsonBodyEncoder
  }

  // MARK: Public

  public func buildURLRequest(request: RequestProtocol) throws -> URLRequest {
    var components = URLComponents()
    components.scheme = request.scheme
    components.host = request.host
    components.path = request.path

    let additionalParams = request.defaultQueryParams.map { key, value -> URLQueryItem in
      URLQueryItem(name: "\(key)", value: "\(value)")
    }
    var queryItems: [URLQueryItem] = []
    queryItems.append(contentsOf: additionalParams)

    if let urlParams = request.urlParams {
      var parameterQueryItems = try urlQueryEncoder.encode(urlParams)
      queryItems.append(contentsOf: parameterQueryItems)
    }
    components.queryItems = queryItems

    guard let url = components.url else {
      throw NetworkError.invalidURL
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = request.requestType.rawValue

    if !request.headers.isEmpty {
      urlRequest.allHTTPHeaderFields = request.headers
    }

    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

    if let params = request.params {
      urlRequest.httpBody = try jsonBodyEncoder.encode(params)
    }

    return urlRequest
  }

  // MARK: Private

  private let urlQueryEncoder: URLQueryEncoding
  private let jsonBodyEncoder: JSONBodyEncoding

}
