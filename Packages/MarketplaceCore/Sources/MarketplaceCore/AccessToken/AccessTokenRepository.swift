//
//  AccessTokenRepository.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

// MARK: - AccessTokenRepositoryProtocol

public protocol AccessTokenRepositoryProtocol {
  func saveAccessToken(_ token: String)
  func getAccessToken() -> String
}

// MARK: - AccessTokenRepository

public final class AccessTokenRepository {

  // MARK: Lifecycle

  public init(dataStore: AccessTokenStoring) {
    self.dataStore = dataStore
  }

  // MARK: Private

  private let dataStore: AccessTokenStoring

}

// MARK: AccessTokenRepositoryProtocol

extension AccessTokenRepository: AccessTokenRepositoryProtocol {
  public func saveAccessToken(_ token: String) {
    dataStore.saveAccessToken(token)
  }

  public func getAccessToken() -> String {
    dataStore.getAccessToken()
  }
}
