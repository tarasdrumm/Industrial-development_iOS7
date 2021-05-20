//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Тарас Андреев on 05.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let stackView = UIStackView()
    private let photoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(imageNames: [String]) {
        
        for i in 0...3 {
            let image = UIImage(named: imageNames[i])
            (stackView.arrangedSubviews[i] as! UIImageView).image = image ?? nil
        }
    }
    
    private func setup() {
       
        for _ in 0...3 {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            imageView.contentMode = .scaleAspectFill
            stackView.addArrangedSubview(imageView)
        }
        
        photoLabel.text = "Photos"
        photoLabel.textColor = .black
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
    
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        contentView.addSubview(stackView)
        contentView.addSubview(photoLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -12)
        ])
    }
}

