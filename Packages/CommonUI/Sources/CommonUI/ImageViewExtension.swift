//
//  UIImageViewExtension.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Kingfisher
import UIKit

extension UIImageView {
  public func setImage(from url: URL) {
    kf.setImage(with: url)
  }
}
