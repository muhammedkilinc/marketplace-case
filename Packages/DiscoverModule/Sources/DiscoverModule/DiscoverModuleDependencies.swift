//
//  DiscoverModuleDependencies.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import Network

public struct DiscoverModuleDependencies {
  let requestManager: RequestManaging
  let accessTokenRepository: AccessTokenRepositoryProtocol

  public init(requestManager: RequestManaging,
              accessTokenRepository: AccessTokenRepositoryProtocol) {
    self.requestManager = requestManager
    self.accessTokenRepository = accessTokenRepository
  }
}
