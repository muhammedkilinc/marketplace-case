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
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    AppLoader.load()

    guard let windowScene = (scene as? UIWindowScene) else {
      return
    }
    let window = UIWindow(windowScene: windowScene)
    AppConfigurator.configureRootView(in: window, dependencies: AppDIContainer.shared)

    /// 5. Set the window and call makeKeyAndVisible()
    self.window = window
    window.makeKeyAndVisible()
  }

}

