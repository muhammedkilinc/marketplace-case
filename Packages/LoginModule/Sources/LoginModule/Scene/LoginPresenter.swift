//
//  LoginPresenter.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - LoginPresenterProtocol

protocol LoginPresenterProtocol {
  func didTapLogin(email: String, password: String)
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
  func didTapLogin(email: String, password: String) {
    interactor.login(with: email, password: password)
  }
}

// MARK: LoginInteractorOutput

extension LoginPresenter: LoginInteractorOutput {

  func didEmailValidationFailed() {
    print("Email is not valid")
  }

  func didPasswordValidationFailed() {
    print("Password is not valid")
  }

  func didSuccessLogin() {
    print("Login did success, route to Home")
  }
}
