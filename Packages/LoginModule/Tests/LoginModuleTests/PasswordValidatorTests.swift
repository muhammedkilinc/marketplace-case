//
//  PasswordValidatorTests.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import XCTest
@testable import LoginModule

final class PasswordValidatorTests: XCTestCase {

  func testValidPassword() {
    let validator: PasswordValidator = DefaultPasswordValidator()
    let validPassword = "secure123"
    let isValid = validator.isValidPassword(validPassword)
    XCTAssertTrue(isValid, "Expected password to be valid")
  }

  func testInvalidPassword() {
    let validator: PasswordValidator = DefaultPasswordValidator()
    let invalidPassword = "12"
    let isValid = validator.isValidPassword(invalidPassword)

    XCTAssertFalse(isValid, "Expected password to be invalid")
  }

  func testNilPassword() {
    let validator: PasswordValidator = DefaultPasswordValidator()
    let nilPassword: String? = nil
    let isValid = validator.isValidPassword(nilPassword ?? "")

    XCTAssertFalse(isValid, "Expected nil password to be invalid")
  }
}
