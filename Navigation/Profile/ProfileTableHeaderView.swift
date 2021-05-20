//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Тарас Андреев on 01.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "top9-1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = avatarImageSize.height/2
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        return imageView
    }()

    private let avatarImageSize: CGSize = .init(width: 100, height: 100)

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster cat"
        addSubview(label)
        
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        textField.placeholder = "Waiting for something..."
        addSubview(textField)
        
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
        addSubview(statusLabel)
        
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
        addSubview(button)
        
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        let defaultInset: CGFloat = 16

        avatarImageView.frame = CGRect(
            x: defaultInset,
            y: defaultInset,
            width: avatarImageSize.width,
            height: avatarImageSize.height
        )

        actionButton.frame = CGRect(
            x: defaultInset,
            y: avatarImageView.frame.maxY + defaultInset,
            width: frame.width - defaultInset * 2,
            height: 50
        )

        let statusTextFieldHeight: CGFloat = 45
        let statusTextFieldX = avatarImageView.frame.maxX + defaultInset
        let statusTextFieldY = actionButton.frame.origin.y - 38 - statusTextFieldHeight
        let statusTextFieldWidth = frame.width - statusTextFieldX - defaultInset

        statusTextField.frame = CGRect(
            x: statusTextFieldX,
            y: statusTextFieldY,
            width: statusTextFieldWidth,
            height: statusTextFieldHeight
        )
        
        let statusLabelHeight: CGFloat = 40
        let statusLabelX = avatarImageView.frame.maxX + defaultInset
        let statusLabelY = actionButton.frame.origin.y - statusTextFieldHeight
        let statusLabelWidth = frame.width - statusTextFieldX - defaultInset

        statusLabel.frame = CGRect(
            x: statusLabelX,
            y: statusLabelY,
            width: statusLabelWidth,
            height: statusLabelHeight
        )
         
        let nameLabelX = avatarImageView.frame.maxX + defaultInset

        nameLabel.frame = CGRect(
            x: nameLabelX,
            y: 27,
            width: frame.width - avatarImageSize.width - defaultInset * 2,
            height: 35
        )
    }

    @objc private func buttonTapped() {
        print(statusTextField.text!)
    }

}

 
