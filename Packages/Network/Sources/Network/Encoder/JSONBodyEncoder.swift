//
//  JSONBodyEncoder.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - JSONBodyEncoding

public protocol JSONBodyEncoding {
  func encode<T: Encodable>(_ value: T) throws -> Data
}

// MARK: - JSONBodyEncoder

public struct JSONBodyEncoder: JSONBodyEncoding {
  private let encoder: JSONEncoder

  public init(encoder: JSONEncoder = JSONEncoder()) {
    self.encoder = encoder
  }

  public func encode(_ value: some Encodable) throws -> Data {
    try encoder.encode(value)
  }
}
