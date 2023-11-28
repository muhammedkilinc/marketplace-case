//
//  AnalyticConfigurator.swift
//
//
//  Created by Muhammed Kılınç on 28.11.2023.
//

import FirebaseCore
import FirebaseAnalytics
import FirebaseCrashlytics

// MARK: - AnalyticLoadable

public protocol AnalyticLoadable {
  func load()
}

// MARK: - AnalyticLoader

public class AnalyticLoader: AnalyticLoadable {

  // MARK: Lifecycle

  public init() { }

  // MARK: Public

  public func load() {
    FirebaseApp.configure()
  }
}
