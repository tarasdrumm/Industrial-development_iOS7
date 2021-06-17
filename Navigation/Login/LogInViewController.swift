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
        email.placeholder = " Email of phone"
       
        return email
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = createTextField()
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
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
                
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        
        navigationController?.navigationBar.isHidden = true
        
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
    
    // MARK: Keyboard actions

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
    
    private func setupSubviews() {
        
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
        
        contentView.addSubview(logInButton)
        logInButton.snp.makeConstraints { maker in
            maker.top.equalTo(stackView.snp.bottom).offset(16)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(50)
        }
    }
   
    // MARK: Button action

    @objc private func buttonTapped() {
        let profileVC = ProfileViewController()
        show(profileVC, sender: nil)
    }

    //MARK: Extension alpha
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

