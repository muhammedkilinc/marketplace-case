//
//  App.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Network

public final class App {

  // MARK: Lifecycle

  private init() { }

  // MARK: Public

  public static let shared = App()

  public lazy var requestManager = RequestManager()

  public lazy var accessTokenRepository: AccessTokenRepositoryProtocol = {
    let accessTokenDataStore = AccessTokenStorage()
    return AccessTokenRepository(dataStore: accessTokenDataStore)
  }()

}
