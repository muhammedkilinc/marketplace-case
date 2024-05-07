//
//  MockRequestManager.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import Foundation
@testable import Network

final class MockRequestManager: RequestManaging {

  // MARK: Lifecycle

  init(expectedResponse: Decodable?,
       expectedFail: Error?) {
    self.expectedResponse = expectedResponse
    self.expectedFail = expectedFail
  }

  // MARK: Internal

  let expectedResponse: Decodable?
  let expectedFail: Error?

  func perform<T>(_: RequestProtocol) async throws -> T where T: Decodable {
    if let expectedResponse {
      return expectedResponse as! T
    }
    if let expectedFail {
      throw expectedFail
    }
    fatalError("You have to give any expectation")
  }
}
