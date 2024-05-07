//
//  SceneDelegate.swift
//  MarketplaceCase
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    AppLoader.load()

    guard let windowScene = (scene as? UIWindowScene) else {
      return
    }
    let window = UIWindow(windowScene: windowScene)
    AppWindowConfigurator.configure(in: window, dependencies: AppDIContainer.shared)

    self.window = window
    window.makeKeyAndVisible()
  }

}
