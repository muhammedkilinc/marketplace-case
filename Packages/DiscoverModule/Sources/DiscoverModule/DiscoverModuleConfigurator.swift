//
//  DiscoverModuleConfigurator.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import UIKit

public final class DiscoverModuleConfigurator {

  // MARK: Lifecycle

  private init() { }

  // MARK: Public

  public static func configure(with dependencies: DiscoverModuleDependencies) -> UIViewController {
    let router = DiscoverRouter()
    let discoverService = DiscoverServiceManager(requestManager: dependencies.requestManager,
                                                 accessTokenRepository: dependencies.accessTokenRepository)
    let interactor = DiscoverInteractor(discoverService: discoverService)
    let presenter = DiscoverPresenter(interactor: interactor, router: router)
    let viewController = DiscoverViewController(presenter: presenter)

    interactor.output = presenter
    presenter.view = viewController
    router.viewController = viewController

    return viewController
  }
}
