//
//  EmailValidator.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - EmailValidator

protocol EmailValidator {
  func isValidEmail(_ email: String) -> Bool
}

// MARK: - DefaultEmailValidator

class DefaultEmailValidator: EmailValidator {
  func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
  }
}
