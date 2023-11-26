//
//  LoginViewController.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import DesignSystem
import UIKit

// MARK: - LoginViewProtocol

protocol LoginViewProtocol: AnyObject {
  func showValidationResult(isValid: Bool)
}

// MARK: - LoginViewController

final class LoginViewController: UIViewController {

  // MARK: Lifecycle

  init(presenter: LoginPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  // MARK: Private

  private let presenter: LoginPresenterProtocol


  private lazy var emailTextField: UITextField = {
    let textField = UITextField()
    textField.font = AppFont.font(for: .subheading)
    // TODO: Customize emailTextField properties
    textField.placeholder = "E-mail address"
    return textField
  }()

  private lazy var passwordTextField: UITextField = {
    let textField = UITextField()
    textField.font = AppFont.font(for: .subheading)
    // TODO: Customize passwordTextField properties
    textField.placeholder = "Password"
    return textField
  }()

  private lazy var loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("Login", for: .normal)
    // TODO: Customize loginButton properties
    button.backgroundColor = UIColor.button
    return button
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 16
    stackView.alignment = .fill
    stackView.distribution = .fill
    return stackView
  }()

  @objc
  private func didTapLoginButton() {
    let email = emailTextField.text ?? "test@test.com"
    let password = passwordTextField.text ?? "123456"
    presenter.validateCredentials(email: email, password: password)
  }

  private func setupUI() {
    view.backgroundColor = .white

    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

    view.addSubview(stackView)

    NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                 stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                 stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Spacing.large),
                                 stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.large)])
  }

}

// MARK: LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
  func showValidationResult(isValid: Bool) {
    if isValid {
      print("Login successful!")
    } else {
      print("Invalid credentials. Please check your email and password.")
    }
  }
}
