//
//  DiscoverViewController.swift
//
//
//  Created by Muhammed Kılınç on 26.11.2023.
//

import CommonUI
import UIKit

// MARK: - DiscoverViewProtocol

protocol DiscoverViewProtocol: AnyObject {
  func configureCollection(delegate: DiscoverDataSourceDelegate)
  func refreshData(with dataContainer: DiscoverDataContainer)
}

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
    setupUI()
    presenter.load()
  }

  // MARK: Private

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    return collectionView
  }()

  private lazy var discoverDataSource: DiscoverDataSourceProtocol = DiscoverDataSource(collectionView: collectionView)

  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(collectionView)
    collectionView.anchorToSuperview()
  }
}

// MARK: DiscoverViewProtocol

extension DiscoverViewController: DiscoverViewProtocol {
  func configureCollection(delegate: DiscoverDataSourceDelegate) {
    discoverDataSource.setDelegate(delegate)
  }

  func refreshData(with dataContainer: DiscoverDataContainer) {
    discoverDataSource.update(with: dataContainer, animate: true)
  }
}
