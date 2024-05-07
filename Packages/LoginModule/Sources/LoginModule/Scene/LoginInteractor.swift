//
//  LoginInteractor.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - LoginInteractorProtocol

protocol LoginInteractorProtocol {
  func login(with email: String, password: String)
}

// MARK: - LoginInteractorOutput

protocol LoginInteractorOutput: AnyObject {
  func didSuccessLogin()
  func didEmailValidationFailed()
  func didPasswordValidationFailed()
}

// MARK: - LoginInteractor

final class LoginInteractor {

  // MARK: Lifecycle

  init(emailValidator: EmailValidator,
       passwordValidator: PasswordValidator,
       loginService: LoginServiceManaging) {
    self.emailValidator = emailValidator
    self.passwordValidator = passwordValidator
    self.loginService = loginService
  }

  // MARK: Internal

  weak var output: LoginInteractorOutput?

  // MARK: Private

  private let emailValidator: EmailValidator
  private let passwordValidator: PasswordValidator
  private let loginService: LoginServiceManaging

}

// MARK: LoginInteractorProtocol

extension LoginInteractor: LoginInteractorProtocol {

  // MARK: Internal

  func login(with email: String, password: String) {
    guard validateCredentials(email: email, password: password) else {
      return
    }
    let parameters = LoginRequestParameters(email: email, password: password)
    Task {
      let response = await loginService.login(parameters: parameters)
      switch response {
      case .success:
        await MainActor.run {
          output?.didSuccessLogin()
        }
      case .failure(let error):
        print("Handle error: \(error)")
      }
    }
  }

  // MARK: Private

  private func validateCredentials(email: String, password: String) -> Bool {
    guard emailValidator.isValidEmail(email) else {
      output?.didEmailValidationFailed()
      return false
    }
    guard passwordValidator.isValidPassword(password) else {
      output?.didPasswordValidationFailed()
      return false
    }
    return true
  }

}
