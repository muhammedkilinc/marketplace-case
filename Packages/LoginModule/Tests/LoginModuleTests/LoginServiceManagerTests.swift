//
//  LoginServiceManagerTests.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import XCTest
@testable import LoginModule
@testable import Network

// MARK: - LoginServiceManagerTests

final class LoginServiceManagerTests: XCTestCase {

  func testLoginSuccess() async throws {
    let dummyResponse = LoginResponse(token: "test-token")
    let mockRequestManager = MockRequestManager(expectedResponse: dummyResponse, expectedFail: nil)
    let mockAccessTokenRepository = MockAccessTokenRepository()
    let loginServiceManager = LoginServiceManager(requestManager: mockRequestManager,
                                                  accessTokenRepository: mockAccessTokenRepository)

    let parameters = LoginRequestParameters(email: "user", password: "password")
    let result = await loginServiceManager.login(parameters: parameters)

    switch result {
    case .success(let response):
      XCTAssertEqual(mockAccessTokenRepository.savedAccessToken, response.token, "Access token should be saved")
      XCTAssertEqual(dummyResponse, response, "Response should be equal")
    case .failure:
      XCTFail("Expected login success")
    }
  }

  func testLoginFailure() async throws {
    let dummyError = NetworkError.unknown
    let mockRequestManager = MockRequestManager(expectedResponse: nil, expectedFail: dummyError)
    let mockAccessTokenRepository = MockAccessTokenRepository()
    let loginServiceManager = LoginServiceManager(requestManager: mockRequestManager,
                                                  accessTokenRepository: mockAccessTokenRepository)

    let parameters = LoginRequestParameters(email: "user", password: "password")
    let result = await loginServiceManager.login(parameters: parameters)

    // Assert
    switch result {
    case .success:
      XCTFail("Expected login failure")
    case .failure(let error):
      let optionalError: NetworkError? = error
      let unwrappedError = try XCTUnwrap(optionalError)
      XCTAssertEqual(unwrappedError, dummyError, "Expected network error")
    }
  }
}

// MARK: - LoginResponse + Equatable

extension LoginResponse: Equatable {
  public static func == (lhs: LoginResponse, rhs: LoginResponse) -> Bool {
    lhs.token == rhs.token
  }
}

// MARK: - NetworkError + Equatable

extension NetworkError: Equatable {
  public static func == (lhs: Network.NetworkError, rhs: Network.NetworkError) -> Bool {
    switch (lhs, rhs) {
    case (.unknown, .unknown):
      return true
    default:
      return false
    }
  }
}
