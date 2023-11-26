//
//  LoginServiceManager.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import MarketplaceCore
import Network

// MARK: - LoginServiceManaging

protocol LoginServiceManaging {
  func login(parameters: LoginRequestParameters) async -> Result<LoginResponse, NetworkError>
}

// MARK: - LoginServiceManager

struct LoginServiceManager {
  let requestManager: RequestManaging
  let accessTokenRepository: AccessTokenRepositoryProtocol
}

// MARK: LoginServiceManaging

extension LoginServiceManager: LoginServiceManaging {
  func login(parameters: LoginRequestParameters) async -> Result<LoginResponse, NetworkError> {
    let request = LoginRequest(parameters: parameters)
    do {
      let response: LoginResponse = try await requestManager.perform(request)
      accessTokenRepository.saveAccessToken(response.token)
      return .success(response)
    } catch let error as NetworkError {
      return .failure(error)
    } catch {
      return .failure(.unknown)
    }
  }
}
