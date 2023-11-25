//
//  AppFont.swift
//
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import UIKit

public enum AppFont {
  public enum Style {
    case headline
    case title
    case subheading
    case medium
    case regular
    case minicaps
    case button
  }

  public static func font(for style: Style) -> UIFont {
    switch style {
    case .headline:
      return UIFont(name: "Roboto-Regular", size: 24)!
    case .title:
      return UIFont(name: "Roboto-Medium", size: 20)!
    case .subheading:
      return UIFont(name: "Roboto-Regular", size: 16)!
    case .medium:
      return UIFont(name: "Roboto-Medium", size: 14)!
    case .regular:
      return UIFont(name: "Roboto-Regular", size: 14)!
    case .minicaps:
      return UIFont(name: "Roboto-Medium", size: 10)!
    case .button:
      return UIFont(name: "Roboto-Medium", size: 14)!
    }
  }
}
