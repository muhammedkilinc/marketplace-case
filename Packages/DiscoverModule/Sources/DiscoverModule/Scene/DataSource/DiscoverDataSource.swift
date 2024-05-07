//
//  DiscoverDataSource.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import UIKit

// MARK: - DiscoverDataContainer

struct DiscoverDataContainer {
  let featuredProducts: [ProductCellEntity]?
  let topRatedProducts: [ProductCellEntity]?
  let popularProducts: [ProductCellEntity]?
}

// MARK: - DiscoverDataSourceDelegate

protocol DiscoverDataSourceDelegate: AnyObject {
  func didSelectItem(at indexPath: IndexPath, section: DiscoverDataSource.Section)
}

// MARK: - DiscoverDataSourceProtocol

protocol DiscoverDataSourceProtocol {
  func update(with dataProvider: DiscoverDataContainer, animate: Bool)
  func setDelegate(_ delegate: DiscoverDataSourceDelegate)
}

// MARK: - DiscoverDataSource

final class DiscoverDataSource: NSObject {

  // MARK: Lifecycle

  init(collectionView: UICollectionView) {
    let productCellRegistration = UICollectionView.CellRegistration<ProductCell, ProductCellEntity> { cell, _, identifier in
      cell.configure(with: identifier)
    }

    dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, product -> UICollectionViewCell? in
      let cell = collectionView.dequeueConfiguredReusableCell(using: productCellRegistration, for: indexPath, item: product)
      return cell
    }
    super.init()
    collectionView.delegate = self

    let headerRegistration = UICollectionView.SupplementaryRegistration
    <TitleSupplementaryView>(elementKind: DiscoverLayout.headerElementKind) {
      (supplementaryView, _, indexPath) in
      let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
      supplementaryView.label.text = section.headerTitle
    }

    dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
      if kind == DiscoverLayout.headerElementKind {
        return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
      }
      return nil
    }

    collectionView.setCollectionViewLayout(makeLayout(), animated: true)
  }

  // MARK: Internal

  enum Section {
    case featured
    case topRated
    case popular

    var headerTitle: String {
      switch self {
      case .featured:
        "Featured"
      case .topRated:
        "TopRated"
      case .popular:
        "Popular"
      }
    }
  }

  typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ProductCellEntity>
  typealias DataSource = UICollectionViewDiffableDataSource<Section, ProductCellEntity>
  typealias LayoutSectionProvider = (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?

  var dataSource: DataSource
  weak var delegate: DiscoverDataSourceDelegate?

  // MARK: Private

  private lazy var layout: UICollectionViewCompositionalLayout = {
    let layout = UICollectionViewCompositionalLayout(sectionProvider: self.sectionProvider)
    return layout
  }()

  private lazy var sectionProvider: LayoutSectionProvider = { [weak self] (sectionIndex: Int,
                                                                           _: NSCollectionLayoutEnvironment)
      -> NSCollectionLayoutSection? in
    guard let self else {
      return nil
    }
    let section = dataSource.snapshot().sectionIdentifiers[sectionIndex]
    switch section {
    case .featured:
      return DiscoverLayout.horizontalColumnSection(columnCount: 2)
    case .popular:
      return DiscoverLayout.horizontalColumnSection(columnCount: 3)
    case .topRated:
      return DiscoverLayout.verticalSection()
    }
  }

  private func makeLayout() -> UICollectionViewCompositionalLayout {
    layout
  }

}

// MARK: DiscoverDataSourceProtocol

extension DiscoverDataSource: DiscoverDataSourceProtocol {
  func update(with dataProvider: DiscoverDataContainer, animate _: Bool = true) {
    var snapshot = Snapshot()
    if let products = dataProvider.featuredProducts {
      snapshot.appendSections([.featured])
      snapshot.appendItems(products, toSection: .featured)
    }
    if let products = dataProvider.popularProducts {
      snapshot.appendSections([.popular])
      snapshot.appendItems(products, toSection: .popular)
    }
    if let products = dataProvider.topRatedProducts {
      snapshot.appendSections([.topRated])
      snapshot.appendItems(products, toSection: .topRated)
    }
    dataSource.apply(snapshot, animatingDifferences: true)
  }

  func setDelegate(_ delegate: DiscoverDataSourceDelegate) {
    self.delegate = delegate
  }
}

// MARK: UICollectionViewDelegate

extension DiscoverDataSource: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]

    delegate?.didSelectItem(at: indexPath, section: section)
  }
}
