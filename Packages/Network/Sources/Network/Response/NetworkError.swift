//
//  NetworkError.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  case encodingFailed(Encodable)
  case decodingFailed(String)
  case unknown

  // MARK: Public

  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    case .encodingFailed(let value):
      return "Failed to encode \(value) to URL query parameters."
    case .decodingFailed(let message):
      return message
    case .unknown:
      return "unknown error"
    }
  }
}
