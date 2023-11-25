//
//  DictionaryExtension.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import Foundation

extension Dictionary where Iterator.Element == (key: AnyHashable, value: Any) {

  var jsonString: String {
    guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
      return String()
    }

    let text = String(data: jsonData, encoding: .utf8)
    return text ?? String()
  }
}
