//
//  AppConfigurator.swift
//  MarketplaceCase
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import LoginModule
import UIKit

final class AppConfigurator {

  static func configureRootView(in window: UIWindow,
                                dependencies: AppDIContainer) {
    let loginDependencies = LoginModuleDependencies(requestManager: dependencies.requestManager,
                                                    accessTokenRepository: dependencies.accessTokenRepository,
                                                    discoveryModuleBuilder: dependencies)
    let loginViewController = LoginModuleConfigurator.configureLoginModule(with: loginDependencies)

    let navigationController = UINavigationController(rootViewController: loginViewController)
    window.rootViewController = navigationController
  }

}
