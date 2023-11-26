//
//  DiscoverLayout.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import DesignSystem
import UIKit

struct DiscoverLayout {

  // MARK: Internal

  static let headerElementKind = "header"

  static func verticalSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .estimated(100.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .estimated(100.0))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
    group.interItemSpacing = .fixed(Spacing.xSmall)

    let section = NSCollectionLayoutSection(group: group)
    section.boundarySupplementaryItems = [headerSupplementaryItem()]
    section.interGroupSpacing = 16
    section.contentInsets = .init(top: .zero, leading: Spacing.small, bottom: 0, trailing: Spacing.small)
    return section
  }

  static func horizontalColumnSection(columnCount: Int) -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let widthRatio = 1.0 / CGFloat(columnCount)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(widthRatio),
                                           heightDimension: .fractionalWidth(widthRatio * 1.5))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                   subitems: [item])

    group.contentInsets = .init(top: .zero, leading: Spacing.small, bottom: .zero, trailing: Spacing.small)
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.boundarySupplementaryItems = [headerSupplementaryItem()]
    return section
  }

  // MARK: Private

  private static func headerSupplementaryItem() -> NSCollectionLayoutBoundarySupplementaryItem {
    let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
    let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize,
                                                                 elementKind: DiscoverLayout.headerElementKind, alignment: .top)
    return headerItem
  }
}
