//
//  LogInViewController.swift
//  Navigation
//
//  Created by Тарас Андреев on 11.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

final class LogInViewController: UIViewController {
    
    //MARK: Public properties
    
    var viewModel: LoginViewModel?
    
    // MARK: Subviews
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        return contentView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = #imageLiteral(resourceName: "logo")
        
        return logoView
    }()
    
    private lazy var emailTextField: UITextField = {
        let email = createTextField()
        email.delegate = self
        email.placeholder = " Email of phone"
       
        return email
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = createTextField()
        password.delegate = self
        password.placeholder = " Password"
        password.isSecureTextEntry = true
        
        return password
    }()
    
    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.autocapitalizationType = .none

        return textField
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.masksToBounds = true
        stackView.backgroundColor = .systemGray6
                        
        return stackView
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
                
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isEnabled = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
                
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavigationBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = contentView.bounds.size
    }
    
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func clearFields() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: Convenience
    
    private func setupSubviews() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { maker in
            maker.left.right.equalTo(view)
            maker.top.bottom.height.width.equalTo(scrollView)
        }
        
        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { maker in
            maker.top.equalTo(scrollView).offset(120)
            maker.centerX.equalTo(scrollView)
            maker.height.equalTo(100)
            maker.width.equalTo(100)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.top.equalTo(logoImageView.snp.bottom).offset(120)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(100)
        }
        
        contentView.addSubview(registerButton)
        registerButton.snp.makeConstraints { maker in
            maker.top.equalTo(stackView.snp.bottom).offset(16)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(50)
        }
        
        contentView.addSubview(loginButton)
        loginButton.snp.makeConstraints { maker in
            maker.top.equalTo(registerButton.snp.bottom).offset(10)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(50)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: Actions

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc private func registerButtonTapped() {
        viewModel?.loginInput = emailTextField.text
        viewModel?.passwordInput = passwordTextField.text
        viewModel?.didTapRegisterButton()
    }
    
    @objc private func loginButtonTapped() {
        viewModel?.loginInput = emailTextField.text
        viewModel?.passwordInput = passwordTextField.text
        viewModel?.didTapLoginButton()
    }
}

//MARK: Extension alpha
extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        loginButton.isEnabled = emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        return true
    }
}
