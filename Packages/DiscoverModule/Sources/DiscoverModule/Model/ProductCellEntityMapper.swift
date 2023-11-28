//
//  File.swift
//
//
//  Created by Muhammed Kılınç on 28.11.2023.
//

import DesignSystem
import Foundation
import UIKit

struct ProductCellEntityMapper {
  static func map(from product: ProductEntity) -> ProductCellEntity {
    let oldPriceText: String?
    if let oldPrice = product.oldPrice {
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

      if let discount = product.discount {
        let discountAttributedString = NSAttributedString(string: discount,
                                                          attributes: [.foregroundColor: UIColor.highlight,
                                                                       .font: AppFont.font(for: .medium)])
        priceAttributedString.append(discountAttributedString)
      }
    }
    return ProductCellEntity(title: product.description,
                             imageURL: product.imageUrl?.asURL(),
                             price: "\(product.price.value) \(product.price.currency)",
                             discount: priceAttributedString)
  }
}
