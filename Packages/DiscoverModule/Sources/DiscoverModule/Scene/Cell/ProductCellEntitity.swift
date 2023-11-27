//
//  ProductCellEntitity.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

struct ProductCellEntity: Hashable {
  let title: String
  let imageURL: URL?
  let price: String?
  let discount: NSAttributedString?
  let id = UUID()
}
