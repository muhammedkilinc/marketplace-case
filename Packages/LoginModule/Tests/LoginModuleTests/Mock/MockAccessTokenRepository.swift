//
//  MockAccessTokenRepository.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import Foundation
@testable import MarketplaceCore

final class MockAccessTokenRepository: AccessTokenRepositoryProtocol {
  var savedAccessToken: String?

  func saveAccessToken(_ token: String) {
    savedAccessToken = token
  }

  func getAccessToken() -> String {
    savedAccessToken ?? ""
  }
}
