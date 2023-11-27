//
//  TabBarModuleConfigurator.swift
//
//
//  Created by Muhammed Kılınç on 28.11.2023.
//

import DesignSystem
import Localization
import UIKit

public final class TabBarModuleConfigurator {

  // MARK: Lifecycle

  private init() { }

  // MARK: Public

  public static func configure(with dependencies: TabBarModuleDependencies) -> UIViewController {
    let tabBarViewController = TabBarController()
    tabBarViewController.title = Strings.homeTitle

    let discoveryViewController = dependencies.discoveryModuleBuilder.buildDiscovery()
    let navigationViewController = UINavigationController(rootViewController: discoveryViewController)
    navigationViewController.tabBarItem = UITabBarItem(title: Strings.discoverTabbarTitle, image: Images.TabBar.discover, tag: 0)

    let secondViewController = UIViewController()
    secondViewController.tabBarItem = UITabBarItem(title: nil, image: Images.TabBar.bookmark, tag: 1)

    let thirdViewController = UIViewController()
    thirdViewController.tabBarItem = UITabBarItem(title: nil, image: Images.TabBar.cart, tag: 2)

    let fourthViewController = UIViewController()
    thirdViewController.tabBarItem = UITabBarItem(title: nil, image: Images.TabBar.tag, tag: 3)

    let fifthViewController = UIViewController()
    fifthViewController.tabBarItem = UITabBarItem(title: nil, image: Images.TabBar.settings, tag: 4)

    tabBarViewController.viewControllers = [navigationViewController,
                                            secondViewController,
                                            thirdViewController,
                                            fourthViewController,
                                            fifthViewController]
    return tabBarViewController
  }
}
