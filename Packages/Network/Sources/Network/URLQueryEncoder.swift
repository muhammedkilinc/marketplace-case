//
//  URLQueryEncoder.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

// MARK: - URLQueryEncoding

public protocol URLQueryEncoding {
  func encode<T: Encodable>(_ value: T) throws -> [URLQueryItem]
}

// MARK: - URLQueryEncoder

public struct URLQueryEncoder: URLQueryEncoding {
  private let encoder: JSONEncoder

  public init(encoder: JSONEncoder = JSONEncoder()) {
    self.encoder = encoder
  }

  public func encode(_ value: some Encodable) throws -> [URLQueryItem] {
    let data = try encoder.encode(value)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NetworkError.encodingFailed(value)
    }

    return dictionary.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
  }
}
