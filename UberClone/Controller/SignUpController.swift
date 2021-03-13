//
//  SignUpController.swift
//  UberClone
//
//  Created by andy on 12.03.2021.
//

import UIKit

class SignUpController: UIViewController {

    // MARK: - Properties

    private let titleLabel: UILabel = {
        let label = TitleLabel()
        label.text = "Sign Up"
        return label
    }()

    private let emailTextField: UITextField = {
        FormTextField.initFrom(placeholder: "Email")
    }()

    private lazy var emailContainerView: UIView = {
        InputContainerView.initFrom(iconName: "envelope", field: emailTextField)
    }()

    private let fullNameTextField: UITextField = {
        FormTextField.initFrom(placeholder: "Full Name")
    }()

    private lazy var fullNameContainerView: UIView = {
        InputContainerView.initFrom(iconName: "person", field: fullNameTextField)
    }()

    private let passwordTextField: UITextField = {
        FormTextField.initFrom(placeholder: "Password", isSecureTextEntry: true)
    }()

    private lazy var passwordContainerView: UIView = {
        InputContainerView.initFrom(iconName: "lock", field: passwordTextField)
    }()

    private let accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider", "Driver"])
        sc.backgroundColor = UI.backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87)
        sc.selectedSegmentIndex = 0
        return sc
    }()

    private lazy var accountTypeContainerView: UIView = {
        InputContainerView.initFrom(iconName: nil, field: accountTypeSegmentedControl, showSeparator: false)
    }()

    private let signUpButton: UIButton = {
        let button = SubmitButton()
        button.setTitle("Sign Up", for: .normal)

        return button
    }()

    private let dontHaveAccountButton: UIButton = {
        let button = AttributedButton.initFrom(attributes: [
            ("Already have an account? ", UIColor.lightGray),
            ("Login", UI.mainBlueTint)
        ])

        button.addTarget(self, action: #selector(handleReturnToLogin), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Selectors

    @objc func handleReturnToLogin() {
        navigationController?.popViewController(animated: true)
    }


    // MARK: - Helper functions

    func configureUI() {
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
            fullNameContainerView,
            passwordContainerView,
            accountTypeContainerView,
            signUpButton
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
}
