//
//  App.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import Network
import UIKit
import DiscoverModule

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

extension AppDIContainer: DiscoveryModuleBuilder {
  public func buildDiscovery() -> UIViewController {
    DiscoverModuleConfigurator.configureDiscoverModule()
  }
}
