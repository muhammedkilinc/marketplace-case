//
//  AccessTokenStorage.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

// MARK: - AccessTokenStoring

public protocol AccessTokenStoring {
  func saveAccessToken(_ token: String)
  func getAccessToken() -> String
}

// MARK: - AccessTokenStorage

public final class AccessTokenStorage: AccessTokenStoring {

  // MARK: Lifecycle

  public init() { }

  // MARK: Public

  public func saveAccessToken(_ token: String) {
    accessToken = token
  }

  public func getAccessToken() -> String {
    accessToken ?? ""
  }

  // MARK: Private

  private var accessToken: String?

}
