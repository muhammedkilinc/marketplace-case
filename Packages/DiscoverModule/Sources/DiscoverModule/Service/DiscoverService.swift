//
//  DiscoverServiceManager.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import Network

// MARK: - DiscoverServiceManaging

protocol DiscoverServiceManaging {
  func fetchDiscoverFirst() async -> Result<[ProductEntity], NetworkError>
  func fetchDiscoverSecond() async -> Result<[ProductEntity], NetworkError>
  func fetchDiscoverThird() async -> Result<[ProductEntity], NetworkError>
}

// MARK: - DiscoverServiceManager

struct DiscoverServiceManager {
  let requestManager: RequestManaging
  let accessTokenRepository: AccessTokenRepositoryProtocol
}

// MARK: DiscoverServiceManaging

extension DiscoverServiceManager: DiscoverServiceManaging {
  func fetchDiscoverFirst() async -> Result<[ProductEntity], NetworkError> {
    let request = DiscoverFirstRequest(token: accessTokenRepository.getAccessToken())
    do {
      let response: ProductResponse = try await requestManager.perform(request)
      return .success(response.list)
    } catch let error as NetworkError {
      return .failure(error)
    } catch {
      return .failure(.unknown)
    }
  }

  func fetchDiscoverSecond() async -> Result<[ProductEntity], NetworkError> {
    let request = DiscoverSecondRequest(token: accessTokenRepository.getAccessToken())
    do {
      let response: ProductResponse = try await requestManager.perform(request)
      return .success(response.list)
    } catch let error as NetworkError {
      return .failure(error)
    } catch {
      return .failure(.unknown)
    }
  }

  func fetchDiscoverThird() async -> Result<[ProductEntity], NetworkError> {
    let request = DiscoverThirdRequest(token: accessTokenRepository.getAccessToken())
    do {
      let response: ProductResponse = try await requestManager.perform(request)
      return .success(response.list)
    } catch let error as NetworkError {
      return .failure(error)
    } catch {
      return .failure(.unknown)
    }
  }
}
