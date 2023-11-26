//
//  DiscoverInteractor.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

// MARK: - DiscoverInteractorOutput

protocol DiscoverInteractorOutput: AnyObject {
  func didFetchDiscoverFirstList(products: [ProductEntity])
  func didFetchDiscoverSecondList(products: [ProductEntity])
  func didFetchDiscoverThirdList(products: [ProductEntity])
}

// MARK: - DiscoverInteractorProtocol

protocol DiscoverInteractorProtocol {
  func fetchDiscoverFirstList()
  func fetchDiscoverSecondList()
  func fetchDiscoverThirdList()
}

// MARK: - DiscoverInteractor

final class DiscoverInteractor {

  // MARK: Lifecycle

  init(discoverService: DiscoverServiceManaging) {
    self.discoverService = discoverService
  }

  // MARK: Internal

  weak var output: DiscoverInteractorOutput?

  // MARK: Private

  private let discoverService: DiscoverServiceManaging
}

// MARK: DiscoverInteractorProtocol

extension DiscoverInteractor: DiscoverInteractorProtocol {
  func fetchDiscoverFirstList() {
    Task {
      let response = await discoverService.fetchDiscoverFirst()
      switch response {
      case .success(let data):
        await MainActor.run {
          output?.didFetchDiscoverFirstList(products: data)
        }
      case .failure(let error):
        print("Handle error: \(error)")
      }
    }
  }

  func fetchDiscoverSecondList() {
    Task {
      let response = await discoverService.fetchDiscoverSecond()
      switch response {
      case .success(let data):
        await MainActor.run {
          output?.didFetchDiscoverSecondList(products: data)
        }
      case .failure(let error):
        print("Handle error: \(error)")
      }
    }
  }

  func fetchDiscoverThirdList() {
    Task {
      let response = await discoverService.fetchDiscoverThird()
      switch response {
      case .success(let data):
        await MainActor.run {
          output?.didFetchDiscoverThirdList(products: data)
        }
      case .failure(let error):
        print("Handle error: \(error)")
      }
    }
  }
}
