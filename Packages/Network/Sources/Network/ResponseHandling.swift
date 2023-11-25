//
//  ResponseHandler.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - ResponseHandling

public protocol ResponseHandling {
  func handle<T: Decodable>(data: Data) throws -> T
}

// MARK: - ResponseHandler

public class ResponseHandler: ResponseHandling {

  // MARK: Lifecycle

  public init(parser: DataParserProtocol = DataParser()) {
    self.parser = parser
  }

  // MARK: Public

  public func handle<T: Decodable>(data: Data) throws -> T {
    do {
      let decoded: T = try parser.parse(data: data)
      return decoded
    } catch let error as DecodingError {
      let errorMessage: String
      switch error {
      case .typeMismatch(let type, let context):
        errorMessage =
          "Type mismatch: Expected type \(type) but found \(context.debugDescription). CodingPath: \(context.codingPath)"
      case .valueNotFound(let type, let context):
        errorMessage = "Value not found: Expected value of type \(type) at \(context.codingPath)"
      case .keyNotFound(let key, let context):
        errorMessage = "Key not found: \(key). CodingPath: \(context.codingPath)"
      case .dataCorrupted(let context):
        errorMessage = "Data corrupted: \(context.debugDescription)"
      @unknown default:
        errorMessage = "Unknown decoding error"
      }
      throw NetworkError.decodingFailed(errorMessage)
    }
  }

  // MARK: Internal

  let parser: DataParserProtocol

}
