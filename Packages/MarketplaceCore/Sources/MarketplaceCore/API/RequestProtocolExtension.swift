//
//  Network.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Network

extension RequestProtocol {
  public var scheme: String {
    "https"
  }

  public var host: String {
    "teamdefinex-mobile-auth-casestudy.vercel.app"
  }

  public var headers: [String: String] {
    [:]
  }

  public var defaultQueryParams: [String: Any] {
    [:]
  }
}
