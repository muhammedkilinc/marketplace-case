//
//  LoginInteractor.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - LoginInteractorProtocol

protocol LoginInteractorProtocol {
  func validateCredentials(email: String, password: String)
}

// MARK: - LoginInteractorOutput

protocol LoginInteractorOutput: AnyObject {
  func didValidateCredentials(isValid: Bool)
}

// MARK: - LoginInteractor

final class LoginInteractor {

  // MARK: Lifecycle

  init(emailValidator: EmailValidator,
       passwordValidator: PasswordValidator) {
    self.emailValidator = emailValidator
    self.passwordValidator = passwordValidator
  }

  // MARK: Internal

  weak var output: LoginInteractorOutput?

  // MARK: Private

  private let emailValidator: EmailValidator
  private let passwordValidator: PasswordValidator

}

// MARK: LoginInteractorProtocol

extension LoginInteractor: LoginInteractorProtocol {

  func validateCredentials(email: String, password: String) {
    let isEmailValid = emailValidator.isValidEmail(email)
    let isPasswordValid = passwordValidator.isValidPassword(password)

    output?.didValidateCredentials(isValid: isEmailValid && isPasswordValid)
  }
}
