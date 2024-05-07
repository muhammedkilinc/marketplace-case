//
//  ProductResponse.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

struct ProductResponse: Decodable {
  let list: [ProductEntity]
}
