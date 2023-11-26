//
//  App.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import DiscoverModule
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
    DiscoverModuleConfigurator.configureDiscoverModule()
  }
}
