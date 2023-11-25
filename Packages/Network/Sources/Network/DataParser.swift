//
//  DataParser.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - DataParserProtocol

public protocol DataParserProtocol {
  func parse<T: Decodable>(data: Data) throws -> T
}

// MARK: - DataParser

public class DataParser: DataParserProtocol {

  // MARK: Lifecycle

  public init(jsonDecoder: JSONDecoder = JSONDecoder()) {
    self.jsonDecoder = jsonDecoder
  }

  // MARK: Public

  public func parse<T: Decodable>(data: Data) throws -> T {
    try jsonDecoder.decode(T.self, from: data)
  }

  // MARK: Private

  private var jsonDecoder: JSONDecoder

}
