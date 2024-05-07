//
//  ProductEntity.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

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
