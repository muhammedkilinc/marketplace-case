//
//  SolidButton.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import DesignSystem
import UIKit

public final class SolidButton: UIButton {

  // MARK: Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButton()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private func setupButton() {
    backgroundColor = UIColor.variantGreen
    setTitleColor(.onPrimary, for: .normal)
    titleLabel?.font = AppFont.font(for: .medium)
    layer.cornerRadius = CornerRadius.medium
  }

}
