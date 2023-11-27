//
//  AppWindowConfigurator.swift
//  MarketplaceCase
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import LoginModule
import UIKit

final class AppWindowConfigurator {

  static func configure(in window: UIWindow,
                        dependencies: AppDIContainer) {
    let loginViewController = dependencies.buildLogin()
    let navigationController = UINavigationController(rootViewController: loginViewController)
    window.rootViewController = navigationController
  }
}
