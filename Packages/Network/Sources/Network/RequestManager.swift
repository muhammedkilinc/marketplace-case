//
//  RequestManager.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - RequestManaging

public protocol RequestManaging {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

// MARK: - RequestManager

public final class RequestManager: RequestManaging {

  // MARK: Lifecycle

  public init(networkSesionManager: NetworkSessionManaging = NetworkSesionManager(),
              responseHandler: ResponseHandler = ResponseHandler()) {
    self.networkSesionManager = networkSesionManager
    self.responseHandler = responseHandler
  }

  // MARK: Public

  public func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
    let data = try await networkSesionManager.perform(request)
    return try responseHandler.handle(data: data)
  }

  // MARK: Private

  private let networkSesionManager: NetworkSessionManaging
  private let responseHandler: ResponseHandler

}

