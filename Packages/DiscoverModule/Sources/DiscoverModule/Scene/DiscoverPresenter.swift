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
    print("didFetchDiscoverFirstList: \(products)")
  }

  func didFetchDiscoverSecondList(products: [ProductEntity]) {
    print("didFetchDiscoverSecondList: \(products)")
  }

  func didFetchDiscoverThirdList(products: [ProductEntity]) {
    print("didFetchDiscoverThirdList: \(products)")
  }

}
