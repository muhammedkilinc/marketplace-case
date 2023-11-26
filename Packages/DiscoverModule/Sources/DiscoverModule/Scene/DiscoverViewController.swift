//
//  DiscoverViewController.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import UIKit

// MARK: - DiscoverViewProtocol

protocol DiscoverViewProtocol: AnyObject { }

// MARK: - DiscoverViewController

final class DiscoverViewController: UIViewController {

  // MARK: Lifecycle

  init(presenter: DiscoverPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  let presenter: DiscoverPresenterProtocol

}

// MARK: DiscoverViewProtocol

extension DiscoverViewController: DiscoverViewProtocol { }
