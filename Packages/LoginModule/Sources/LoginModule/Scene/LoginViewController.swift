//
//  LoginViewController.swift
//
//  Created by Muhammed Kılınç on 25.11.2023.
//

import CommonUI
import DesignSystem
import Localization
import UIKit

// MARK: - LoginViewProtocol

protocol LoginViewProtocol: AnyObject { }

// MARK: - LoginViewController

final class LoginViewController: UIViewController {

  // MARK: Lifecycle

  init(presenter: LoginPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  // MARK: Private

  private enum Constants {
    static let buttonHeight: CGFloat = 40
    static let inputHeight: CGFloat = 50
  }

  private let presenter: LoginPresenterProtocol

  private lazy var emailTextField: UITextField = {
    let textField = UITextField()
    textField.font = AppFont.font(for: .subheading)
    textField.placeholder = Strings.emailPlaceholder
    textField.borderStyle = .line
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  private lazy var passwordTextField: UITextField = {
    let textField = UITextField()
    textField.font = AppFont.font(for: .subheading)
    textField.placeholder = Strings.passwordPlaceholder
    textField.borderStyle = .line
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isSecureTextEntry = true
    return textField
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = AppFont.font(for: .title)
    label.text = "Definex\nCase Study"
    label.textColor = UIColor.variantGreen
    label.numberOfLines = .zero
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    return label
  }()

  private lazy var loginButton: SolidButton = {
    let button = SolidButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(Strings.loginButtonTitle, for: .normal)
    return button
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = Spacing.xLarge
    stackView.alignment = .fill
    stackView.distribution = .fill
    return stackView
  }()

  @objc
  private func didTapLoginButton() {
    let email = emailTextField.text
    let password = passwordTextField.text
    presenter.didTapLogin(email: email, password: password)
  }

  private func setupUI() {
    view.backgroundColor = .white

    #if DEBUG
    emailTextField.text = "test@test.com"
    passwordTextField.text = "123456"
    #endif

    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

    view.addSubview(stackView)
    view.addSubview(titleLabel)

    let constraints = [stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                       stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Spacing.large),
                       stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.large),
                       loginButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
                       emailTextField.heightAnchor.constraint(equalToConstant: Constants.inputHeight),
                       passwordTextField.heightAnchor.constraint(equalToConstant: Constants.inputHeight),
                       titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
                       titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor),
                       titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Spacing.large),
                       titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.large)]
    NSLayoutConstraint.activate(constraints)
  }

}

// MARK: LoginViewProtocol

extension LoginViewController: LoginViewProtocol { }
