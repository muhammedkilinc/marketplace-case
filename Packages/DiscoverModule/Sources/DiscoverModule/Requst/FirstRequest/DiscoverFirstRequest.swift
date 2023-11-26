//
//  DiscoverFirstRequest.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import Network

struct DiscoverFirstRequest: RequestProtocol {

  var path = "/discoverFirstHorizontalList"
  var requestType: RequestType = .get

  var params: Encodable? = nil
  var urlParams: Encodable? = nil

  private let token: String

  init(token: String) {
    self.token = token
  }

  var headers: [String: String] {
    [Constants.Keys.token: token]
  }
}
