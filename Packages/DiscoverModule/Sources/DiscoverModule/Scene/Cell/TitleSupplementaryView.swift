//
//  TitleSupplementaryView.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import CommonUI
import DesignSystem
import UIKit

// MARK: - TitleSupplementaryView

final class TitleSupplementaryView: UICollectionReusableView {

  // MARK: Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError()
  }

  // MARK: Internal

  lazy var label: UILabel = {
    let label = UILabel()
    label.font = AppFont.font(for: .subheading)
    label.textColor = .textColor
    return label
  }()

}

extension TitleSupplementaryView {
  func configure() {
    addSubview(label)
    let inset = CGFloat(10)
    label.anchorToSuperview(with: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
  }
}
