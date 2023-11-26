//
//  UIViewExtension.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import UIKit

extension UIView {
  // Anchors view to all sides of its superview
  public func anchorToSuperview(with insets: UIEdgeInsets = .zero) {
    guard let superview else {
      return
    }
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
                                 bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom),
                                 leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left),
                                 trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right)])
  }

  // Sets specific width and height
  public func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
    translatesAutoresizingMaskIntoConstraints = false

    if let width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    if let height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }

  public func setRatio(ratio: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio).isActive = true
  }
}
