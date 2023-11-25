//
//  DataExtension.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

extension Data {
  func asJSONString() -> String {
    guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments),
          let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
    else {
      return String()
    }
    return String(data: jsonData, encoding: .utf8) ?? String()
  }
}
