//
//  RequestProtocol.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

public protocol RequestProtocol {
  var host: String { get }
  var scheme: String { get }
  var path: String { get }
  var requestType: RequestType { get }
  var headers: [String: String] { get }
  var params: Encodable? { get }
  var urlParams: Encodable? { get }
  var defaultQueryParams: [String: Any] { get }
}
