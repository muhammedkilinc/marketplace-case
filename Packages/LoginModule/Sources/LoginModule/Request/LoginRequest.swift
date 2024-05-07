//
//  LoginRequest.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import Network

struct LoginRequest: RequestProtocol {

  var path = "/login"
  var requestType: RequestType = .post

  var params: Encodable?
  var urlParams: Encodable? = nil

  init(parameters: LoginRequestParameters) {
    params = parameters
  }
}
