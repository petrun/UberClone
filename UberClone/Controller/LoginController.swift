//
//  LoginController.swift
//  UberClone
//
//  Created by andy on 11.03.2021.
//

import Firebase
import UIKit
import SnapKit

class LoginController: UIViewController {

    // MARK: - Properties

    private let titleLabel: UILabel = {
        let label = TitleLabel()
        label.text = "Login"
        return label
    }()

    private let emailTextField: UITextField = {
        FormTextField.initFrom(placeholder: "Email")
    }()

    private lazy var emailContainerView: UIView = {
        InputContainerView.initFrom(iconName: "envelope", field: emailTextField)
    }()

    private let passwordTextField: UITextField = {
        FormTextField.initFrom(placeholder: "Password", isSecureTextEntry: true)
    }()

    private lazy var passwordContainerView: UIView = {
        InputContainerView.initFrom(iconName: "lock", field: passwordTextField)
    }()

    private let loginButton: UIButton = {
        let button = SubmitButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        return button
    }()

    private let dontHaveAccountButton: UIButton = {
        let button = AttributedButton.initFrom(attributes: [
            ("Don't have an account? ", UIColor.lightGray),
            ("Sign up", UI.mainBlueTint)
        ])

        button.addTarget(self, action: #selector(handleShowSingUp), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Selectors

    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        print("Run auth")

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print("Auth error \(error.localizedDescription)")
                return
            }

            guard let uid = result?.user.uid else { return }

            print("User loggined: \(uid)")
            
            self?.dismiss(animated: true)
        }
    }

    @objc func handleShowSingUp() {
        let signUpController = SignUpController()
        navigationController?.pushViewController(signUpController, animated: true)
    }

    // MARK: - Helper functions

    func configureUI() {
        configureNavigationBar()
        
        view.backgroundColor = UI.backgroundColor

        configureSignUpForm()
        configureFooter()
    }

    func configureSignUpForm() {
        // titleLabel
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view)
        }

        // stack
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            passwordContainerView,
            loginButton
        ])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16

        view.addSubview(stack)

        stack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
        }
    }

    func configureFooter() {
        // dontHaveAccountButton
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}
