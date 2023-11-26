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

  public static func configureLoginModule() -> UIViewController {
    let emailValidator = DefaultEmailValidator()
    let passwordValidator = DefaultPasswordValidator()
    let loginService = LoginServiceManager(requestManager: App.shared.requestManager,
                                           accessTokenRepository: App.shared.accessTokenRepository)

    let router = LoginRouter()
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
