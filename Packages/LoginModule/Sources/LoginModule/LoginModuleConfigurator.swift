//
//  LoginConfigurator.swift
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import UIKit

public final class LoginModuleConfigurator {

  // MARK: Lifecycle

  private init() { }

  // MARK: Public

  public static func configureLoginModule(with dependencies: LoginModuleDependencies) -> UIViewController {
    let emailValidator = DefaultEmailValidator()
    let passwordValidator = DefaultPasswordValidator()
    let loginService = LoginServiceManager(requestManager: dependencies.requestManager,
                                           accessTokenRepository: dependencies.accessTokenRepository)

    let router = LoginRouter(discoveryModuleBuilder: dependencies.discoveryModuleBuilder)
    let interactor = LoginInteractor(emailValidator: emailValidator,
                                     passwordValidator: passwordValidator,
                                     loginService: loginService)
    let presenter = LoginPresenter(interactor: interactor, router: router)
    let viewController = LoginViewController(presenter: presenter)

    interactor.output = presenter
    presenter.view = viewController
    router.viewController = viewController

    return viewController
  }
}
