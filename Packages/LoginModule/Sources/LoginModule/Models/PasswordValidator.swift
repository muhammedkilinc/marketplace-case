//
//  PasswordValidator.swift
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

// MARK: - PasswordValidator

protocol PasswordValidator {
  func isValidPassword(_ password: String) -> Bool
}

// MARK: - DefaultPasswordValidator

class DefaultPasswordValidator: PasswordValidator {
  func isValidPassword(_ password: String) -> Bool {
    password.count >= 3
  }
}
