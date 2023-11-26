//
//  DiscoverInteractor.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import Foundation

// MARK: - DiscoverInteractorOutput

protocol DiscoverInteractorOutput: AnyObject { }

// MARK: - DiscoverInteractorProtocol

protocol DiscoverInteractorProtocol { }

// MARK: - DiscoverInteractor

final class DiscoverInteractor {
  weak var output: DiscoverInteractorOutput?
}

// MARK: DiscoverInteractorProtocol

extension DiscoverInteractor: DiscoverInteractorProtocol { }
