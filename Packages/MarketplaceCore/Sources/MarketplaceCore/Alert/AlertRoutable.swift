//
//  AlertRoutable.swift
//
//
//  Created by Muhammed Kılınç on 27.11.2023.
//

import Localization
import UIKit

// MARK: - AlertRoutable

public protocol AlertRoutable {
  var viewController: UIViewController? { get }
  func routeToAlert(title: String?, message: String?)
}

extension AlertRoutable {

  public func routeToAlert(title: String? = nil, message: String? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: Strings.alertDoneTitle, style: .default, handler: nil)
    alertController.addAction(okAction)
    viewController?.present(alertController, animated: true, completion: nil)
  }
}
