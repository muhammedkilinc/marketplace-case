//
//  AppLoader.swift
//  MarketplaceCase
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Analytic
import DesignSystem
import Foundation

struct AppLoader {

  static func load() {
    FontLoader.loadCustomFonts()
    AppDIContainer.shared.analyticLoader.load()
  }
}
