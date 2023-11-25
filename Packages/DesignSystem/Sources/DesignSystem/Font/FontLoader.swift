//
//  FontLoader.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import UIKit

public enum FontLoader {

  // MARK: Public

  public static func loadCustomFonts() {
    let fontFamilyList: [FontFamily] = [.robotoRegular, .robotoMedium]
    fontFamilyList.forEach { fontFamily in
      let info = fontFamily.rawModel
      Self.registerFont(withName: info.name, extensionName: info.extensionName)
    }
  }

  // MARK: Private

  private static func registerFont(withName fontName: String, extensionName: String) {
    guard let fontURL = Bundle.module.url(forResource: fontName, withExtension: extensionName),
          let fontData = try? Data(contentsOf: fontURL) as CFData,
          let provider = CGDataProvider(data: fontData),
          let font = CGFont(provider)
    else {
      fatalError("Fonts couldn't registered")
    }

    var error: Unmanaged<CFError>?
    guard CTFontManagerRegisterGraphicsFont(font, &error) else {
      if let errorDescription = error?.takeUnretainedValue() {
        print("Error registering font '\(fontName)': \(errorDescription)")
      }
      return
    }
    print("Font '\(fontName)' registered successfully.")
  }
}
