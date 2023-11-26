//
//  LoginModuleDependencies.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation
import MarketplaceCore
import Network

public struct LoginModuleDependencies {
  let requestManager: RequestManaging
  let accessTokenRepository: AccessTokenRepositoryProtocol
  let discoveryModuleBuilder: DiscoveryModuleBuilder

  public init(requestManager: RequestManaging,
              accessTokenRepository: AccessTokenRepositoryProtocol,
              discoveryModuleBuilder: DiscoveryModuleBuilder) {
    self.requestManager = requestManager
    self.accessTokenRepository = accessTokenRepository
    self.discoveryModuleBuilder = discoveryModuleBuilder
  }
}
