//
//  TabBarModuleDependencies.swift
//
//
//  Created by Muhammed Kılınç on 28.11.2023.
//

import Foundation
import Network

public struct TabBarModuleDependencies {
  let discoveryModuleBuilder: DiscoveryModuleBuilder

  public init(discoveryModuleBuilder: DiscoveryModuleBuilder) {
    self.discoveryModuleBuilder = discoveryModuleBuilder
  }
}
