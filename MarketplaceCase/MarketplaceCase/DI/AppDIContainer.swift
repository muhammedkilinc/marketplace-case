//
//  AppDIContainer.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import DiscoverModule
import LoginModule
import MarketplaceCore
import Network
import UIKit

// MARK: - AppDIContainer

public final class AppDIContainer {

  // MARK: Lifecycle

  private init() { }

  // MARK: Public

  public static let shared = AppDIContainer()

  public lazy var requestManager = RequestManager()

  public lazy var accessTokenRepository: AccessTokenRepositoryProtocol = {
    let accessTokenDataStore = AccessTokenStorage()
    return AccessTokenRepository(dataStore: accessTokenDataStore)
  }()

}

// MARK: DiscoveryModuleBuilder

extension AppDIContainer: DiscoveryModuleBuilder {
  public func buildDiscovery() -> UIViewController {
    let discoverDependencies = DiscoverModuleDependencies(requestManager: requestManager,
                                                          accessTokenRepository: accessTokenRepository)
    return DiscoverModuleConfigurator.configureDiscoverModule(with: discoverDependencies)
  }
}

// MARK: LoginModuleBuilder

extension AppDIContainer: LoginModuleBuilder {
  public func buildLogin() -> UIViewController {
    let loginDependencies = LoginModuleDependencies(requestManager: requestManager,
                                                    accessTokenRepository: accessTokenRepository,
                                                    discoveryModuleBuilder: self)
    return LoginModuleConfigurator.configureLoginModule(with: loginDependencies)
  }
}
