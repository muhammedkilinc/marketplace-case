//
//  LoginPresenter.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation
import Localization

// MARK: - LoginPresenterProtocol

protocol LoginPresenterProtocol {
  func didTapLogin(email: String?, password: String?)
}

// MARK: - LoginPresenter

final class LoginPresenter {

  // MARK: Lifecycle

  init(interactor: LoginInteractorProtocol,
       router: LoginRouterProtocol) {
    self.interactor = interactor
    self.router = router
  }

  // MARK: Internal

  weak var view: LoginViewProtocol?

  // MARK: Private

  private let interactor: LoginInteractorProtocol
  private let router: LoginRouterProtocol
}

// MARK: LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
  func didTapLogin(email: String?, password: String?) {
    interactor.login(with: email.orEmpty, password: password.orEmpty)
  }
}

// MARK: LoginInteractorOutput

extension LoginPresenter: LoginInteractorOutput {

  func didEmailValidationFailed() {
    router.routeToAlert(title: Strings.emailValidationAlert)
  }

  func didPasswordValidationFailed() {
    router.routeToAlert(title: Strings.passwordValidationAlert)
  }

  func didSuccessLogin() {
    router.routeToDiscovery()
  }
}
