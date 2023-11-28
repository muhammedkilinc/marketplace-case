//
//  AppDIContainer.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Analytic
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

  public lazy var requestManager: RequestManaging = RequestManager()
  public lazy var analyticLoader: AnalyticLoadable = AnalyticLoader()

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
    return DiscoverModuleConfigurator.configure(with: discoverDependencies)
  }
}

// MARK: LoginModuleBuilder

extension AppDIContainer: LoginModuleBuilder {
  public func buildLogin() -> UIViewController {
    let loginDependencies = LoginModuleDependencies(requestManager: requestManager,
                                                    accessTokenRepository: accessTokenRepository,
                                                    tabBarModuleBuilder: self)
    return LoginModuleConfigurator.configure(with: loginDependencies)
  }
}

// MARK: TabBarModuleBuilder

extension AppDIContainer: TabBarModuleBuilder {
  public func buildTabBar() -> UIViewController {
    let tabBarModuleDependencies = TabBarModuleDependencies(discoveryModuleBuilder: self)
    return TabBarModuleConfigurator.configure(with: tabBarModuleDependencies)
  }
}
