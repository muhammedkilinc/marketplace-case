//
//  EmailValidatorTests.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import XCTest
@testable import LoginModule

final class EmailValidatorTests: XCTestCase {

  func testValidEmail() {
    let validator: EmailValidator = DefaultEmailValidator()
    let validEmail = "test@example.com"
    let isValid = validator.isValidEmail(validEmail)

    XCTAssertTrue(isValid, "Expected email to be valid")
  }

  func testInvalidEmail() {
    let validator: EmailValidator = DefaultEmailValidator()
    let invalidEmail = "invalid_email"
    let isValid = validator.isValidEmail(invalidEmail)

    XCTAssertFalse(isValid, "Expected email to be invalid")
  }

  func testEmptyEmail() {
    let validator: EmailValidator = DefaultEmailValidator()
    let emptyEmail = ""
    let isValid = validator.isValidEmail(emptyEmail)

    XCTAssertFalse(isValid, "Expected empty email to be invalid")
  }

  func testNilEmail() {
    let validator: EmailValidator = DefaultEmailValidator()
    let nilEmail: String? = nil
    let isValid = validator.isValidEmail(nilEmail ?? "")

    XCTAssertFalse(isValid, "Expected nil email to be invalid")
  }

}
