//
//  ProductEntity.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import DesignSystem
import Foundation
import UIKit

// MARK: - ProductEntity

struct ProductEntity: Decodable {
  let imageUrl: String?
  let description: String
  let price: PriceEntity
  let oldPrice: PriceEntity?
  let discount: String?
  let ratePercentage: Double?

  let id = UUID()

  private enum CodingKeys: String, CodingKey {
    case imageUrl
    case description
    case price
    case oldPrice
    case discount
    case ratePercentage
  }
}

extension ProductEntity {
  func mapToProductCellEntity() -> ProductCellEntity {
    let oldPriceText: String?
    if let oldPrice {
      oldPriceText = "\(oldPrice.value) \(oldPrice.currency)"
    } else {
      oldPriceText = nil
    }
    let priceAttributedString = NSMutableAttributedString()
    if let oldPriceText {
      let oldPriceAttributedString = NSAttributedString(string: oldPriceText,
                                                        attributes: [.foregroundColor: UIColor.textColor,
                                                                     .strikethroughStyle: NSUnderlineStyle
                                                                       .single.rawValue,
                                                                     .strikethroughColor: UIColor.black,
                                                                     .font: AppFont.font(for: .medium)])
      priceAttributedString.append(oldPriceAttributedString)

      priceAttributedString.append(NSAttributedString(string: " • ",
                                                      attributes: [.font: AppFont.font(for: .medium)]))

      if let discount {
        let discountAttributedString = NSAttributedString(string: discount,
                                                          attributes: [.foregroundColor: UIColor.highlight,
                                                                       .font: AppFont.font(for: .medium)])
        priceAttributedString.append(discountAttributedString)
      }
    }
    return ProductCellEntity(title: description,
                             imageURL: imageUrl?.asURL(),
                             price: "\(price.value) \(price.currency)",
                             discount: priceAttributedString)
  }
}
