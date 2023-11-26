//
//  ProductCell.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import CommonUI
import DesignSystem
import UIKit

final class ProductCell: UICollectionViewCell {

  // MARK: Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  func configure(with product: ProductCellEntitity) {
    titleLabel.text = product.title
    priceLabel.text = product.price
    discountLabel.text = product.discount
    productImageView.setImage(from: product.imageURL)
  }

  // MARK: Private

  private lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 4
    return view
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.textColor = .textColor
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .textColor
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel()
    label.textColor = .textColor
    return label
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = Spacing.medium
    return stackView
  }()

  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()

  private func setupUI() {
    contentView.addSubview(containerView)
    containerView.addSubview(stackView)

    stackView.addArrangedSubview(productImageView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(discountLabel)

    containerView.anchorToSuperview()
    stackView.anchorToSuperview(with: UIEdgeInsets(top: Spacing.medium,
                                                   left: Spacing.medium,
                                                   bottom: Spacing.medium,
                                                   right: Spacing.medium))

    productImageView.setRatio(ratio: 1.0)
  }

}

@available(iOS 17.0, *)
#Preview("ProductCell", traits: .fixedLayout(width: 170, height: 248)) {
  let cell = ProductCell()
  cell.configure(with: ProductCellEntitity(title: "Dummy title",
                                           imageURL: URL(string: "https://teamdefinex-mobile-auth-casestudy.vercel.app/image/6")!,
                                           price: "256.99 $",
                                           discount: "39.99 $"))

  return cell
}
