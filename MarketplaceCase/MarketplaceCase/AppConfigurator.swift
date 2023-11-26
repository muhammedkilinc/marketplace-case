//
//  AppConfigurator.swift
//  MarketplaceCase
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import LoginModule
import UIKit

final class AppConfigurator {

  static func configureRootView(in window: UIWindow) {
    let loginViewController = LoginModuleConfigurator.configureLoginModule()

    let navigationController = UINavigationController(rootViewController: loginViewController)
    window.rootViewController = navigationController
  }

}
