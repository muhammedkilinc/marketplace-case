//
//  DiscoverPresenter.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

// MARK: - DiscoverPresenterProtocol

protocol DiscoverPresenterProtocol {
  func load()
}

// MARK: - DiscoverPresenter

final class DiscoverPresenter {

  // MARK: Lifecycle

  init(interactor: DiscoverInteractorProtocol,
       router: DiscoverRouterProtocol) {
    self.interactor = interactor
    self.router = router
  }

  // MARK: Internal

  weak var view: DiscoverViewProtocol?

  // MARK: Private

  private let interactor: DiscoverInteractorProtocol
  private let router: DiscoverRouterProtocol

  private var discoverFirstList: [ProductEntity]?
  private var discoverSecondList: [ProductEntity]?
  private var discoverThirdList: [ProductEntity]?

  private func refreshDiscovers() {
    let featuredProducts = discoverFirstList?.map { ProductCellEntityMapper.map(from: $0) }
    let topRatedProducts = discoverSecondList?.map { ProductCellEntityMapper.map(from: $0) }
    let popularProducts = discoverThirdList?.map { ProductCellEntityMapper.map(from: $0) }

    let dataContainer = DiscoverDataContainer(featuredProducts: featuredProducts,
                                              topRatedProducts: topRatedProducts,
                                              popularProducts: popularProducts)
    view?.configureCollection(with: dataContainer, delegate: self)
  }
}

// MARK: DiscoverPresenterProtocol

extension DiscoverPresenter: DiscoverPresenterProtocol {
  func load() {
    interactor.fetchDiscoverFirstList()
    interactor.fetchDiscoverSecondList()
    interactor.fetchDiscoverThirdList()
  }
}

// MARK: DiscoverInteractorOutput

extension DiscoverPresenter: DiscoverInteractorOutput {
  func didFetchDiscoverFirstList(products: [ProductEntity]) {
    discoverFirstList = products
    refreshDiscovers()
  }

  func didFetchDiscoverSecondList(products: [ProductEntity]) {
    discoverSecondList = products
    refreshDiscovers()
  }

  func didFetchDiscoverThirdList(products: [ProductEntity]) {
    discoverThirdList = products
    refreshDiscovers()
  }

}

// MARK: DiscoverDataSourceDelegate

extension DiscoverPresenter: DiscoverDataSourceDelegate {
  func didSelectItem(at _: IndexPath, section _: DiscoverDataSource.Section) {
    // TODO: Handle cell tap action
  }
}
