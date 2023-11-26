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

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  let presenter: DiscoverPresenterProtocol

  override func viewDidLoad() {
    view.backgroundColor = .yellow
    presenter.load()
  }

}

// MARK: DiscoverViewProtocol

extension DiscoverViewController: DiscoverViewProtocol { }
