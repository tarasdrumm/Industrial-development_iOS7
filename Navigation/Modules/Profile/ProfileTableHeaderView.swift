//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Тарас Андреев on 01.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class ProfileTableHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "top9-1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster cat"
        
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        textField.placeholder = "Waiting for something..."
        
        return textField
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = " Set your status"
        statusLabel.layer.borderWidth = 1
        statusLabel.layer.cornerRadius = 12
        statusLabel.layer.borderColor = UIColor.black.cgColor
        statusLabel.layer.masksToBounds = true
        statusLabel.backgroundColor = .white
        
        return statusLabel
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    private func setupLayout() {
        
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(16)
            maker.left.equalToSuperview().inset(16)
            maker.height.width.equalTo(100)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(27)
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
            maker.height.equalTo(35)
        }
        
        addSubview(statusTextField)
        statusTextField.snp.makeConstraints { maker in
            maker.top.equalTo(nameLabel.snp.bottom).offset(0)
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
        }
        
        addSubview(statusLabel)
        statusLabel.snp.makeConstraints { maker in
            maker.top.equalTo(statusTextField.snp.bottom).offset(5)
            maker.left.equalTo(avatarImageView.snp.right).offset(16)
            maker.right.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        }
        
        addSubview(actionButton)
        actionButton.snp.makeConstraints { maker in
            maker.top.equalTo(avatarImageView.snp.bottom).offset(16)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(50)
        }
    }

    @objc private func buttonTapped() {
        print(statusTextField.text!)
    }
}

 
