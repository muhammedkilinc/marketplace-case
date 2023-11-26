//
//  StringExtension.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

extension String {
  public func asURL() -> URL? {
    URL(string: self)
  }
}
