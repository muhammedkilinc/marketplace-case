//
//  File.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

enum FontFamily {
  case robotoRegular
  case robotoMedium

  // MARK: Internal

  struct FontRawModel {
    var name: String
    var extensionName: String
  }

  var rawModel: FontRawModel {
    switch self {
    case .robotoRegular:
      return .init(name: "Roboto-Regular", extensionName: "ttf")
    case .robotoMedium:
      return .init(name: "Roboto-Medium", extensionName: "ttf")
    }
  }
}
