//
//  LoginRouter.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import MarketplaceCore
import UIKit

// MARK: - LoginRouterProtocol

protocol LoginRouterProtocol {
  func routeToDiscovery()
}

// MARK: - LoginRouter

final class LoginRouter {

  // MARK: Lifecycle

  init(discoveryModuleBuilder: DiscoveryModuleBuilder) {
    self.discoveryModuleBuilder = discoveryModuleBuilder
  }

  // MARK: Internal

  weak var viewController: UIViewController?

  // MARK: Private

  private let discoveryModuleBuilder: DiscoveryModuleBuilder

}

// MARK: LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {
  func routeToDiscovery() {
    let discoveryViewController = discoveryModuleBuilder.buildDiscovery()
    let navigationcontroller = UINavigationController(rootViewController: discoveryViewController)
    viewController?.present(navigationcontroller, animated: true)
  }
}
