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

  func configure(with product: ProductCellEntity) {
    titleLabel.text = product.title
    priceLabel.text = product.price
    discountLabel.attributedText = product.discount
    productImageView.setImage(from: product.imageURL)
  }

  // MARK: Private

  private enum Constants {
    static let radius: CGFloat = 4
    static let imageRatio: CGFloat = 1.25
  }

  private lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = Constants.radius
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 3
    label.textColor = .textColor
    label.font = AppFont.font(for: .subheading)
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .textColor
    label.font = AppFont.font(for: .medium)
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel()
    label.textColor = .textColor
    label.font = AppFont.font(for: .minicaps)
    return label
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = Spacing.medium
    return stackView
  }()

  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()

  private func setupUI() {
    contentView.addSubview(containerView)
    containerView.addSubview(stackView)

    stackView.addArrangedSubview(productImageView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(priceLabel)
    stackView.addArrangedSubview(discountLabel)

    configureConstraints()

    containerView.addShadow(color: .black,
                            radius: Constants.radius,
                            opacity: 0.1,
                            offset: CGSize(width: 1, height: 1))
  }

  private func configureConstraints() {
    configureContainerConstraints()

    configureStackViewConstraints()

    productImageView.setRatio(ratio: Constants.imageRatio)

    let bottomConstraint = containerView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
    bottomConstraint.priority = .defaultHigh
    bottomConstraint.isActive = true
  }

  private func configureContainerConstraints() {
    NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                 containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                 containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
  }

  private func configureStackViewConstraints() {
    NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Spacing.medium),
                                 stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                                    constant: Spacing.medium),
                                 stackView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor,
                                                                   constant: -Spacing.medium),
                                 stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                                     constant: -Spacing.medium)])
  }

}

@available(iOS 17.0, *)
#Preview("ProductCell", traits: .fixedLayout(width: 170, height: 248)) {
  let cell = ProductCell()
  cell.configure(with: ProductCellEntity(title: "Dummy title",
                                         imageURL: URL(string: "https://teamdefinex-mobile-auth-casestudy.vercel.app/image/6")!,
                                         price: "256.99 $",
                                         discount: NSAttributedString(string: "39.99 $")))

  return cell
}
