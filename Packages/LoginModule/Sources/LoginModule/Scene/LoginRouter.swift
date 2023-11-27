//
//  LoginRouter.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import MarketplaceCore
import UIKit

// MARK: - LoginRouterProtocol

protocol LoginRouterProtocol: AlertRoutable {
  func routeToTabBar()
}

// MARK: - LoginRouter

final class LoginRouter {

  // MARK: Lifecycle

  init(tabBarModuleBuilder: TabBarModuleBuilder) {
    self.tabBarModuleBuilder = tabBarModuleBuilder
  }

  // MARK: Internal

  weak var viewController: UIViewController?

  // MARK: Private

  private let tabBarModuleBuilder: TabBarModuleBuilder

}

// MARK: LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {
  func routeToTabBar() {
    let tabBarViewController = tabBarModuleBuilder.buildTabBar()
    let navigationcontroller = UINavigationController(rootViewController: tabBarViewController)
    navigationcontroller.modalPresentationStyle = .fullScreen
    viewController?.present(navigationcontroller, animated: true)
  }
}
