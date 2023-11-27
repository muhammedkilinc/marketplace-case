//
//  UIEdgeInsetsExtension.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import UIKit

extension UIEdgeInsets {
  public static func insetWithAll(_ allInset: CGFloat) -> UIEdgeInsets {
    .init(top: allInset, left: allInset, bottom: allInset, right: allInset)
  }
}
