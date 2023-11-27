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
  let tabBarModuleBuilder: TabBarModuleBuilder

  public init(requestManager: RequestManaging,
              accessTokenRepository: AccessTokenRepositoryProtocol,
              tabBarModuleBuilder: TabBarModuleBuilder) {
    self.requestManager = requestManager
    self.accessTokenRepository = accessTokenRepository
    self.tabBarModuleBuilder = tabBarModuleBuilder
  }
}
