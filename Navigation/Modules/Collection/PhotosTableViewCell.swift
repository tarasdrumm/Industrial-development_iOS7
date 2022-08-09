//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Тарас Андреев on 05.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

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
       
        for index in 0...3 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: Photos.images[index])
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            imageView.contentMode = .scaleAspectFill
            stackView.addArrangedSubview(imageView)
        }
        let photoLabelText = "photoLabelText".localized(file: "LocalizationProfileViewController")
        photoLabel.text = photoLabelText
        photoLabel.textColor = .black
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
    
        contentView.addSubview(photoLabel)
        photoLabel.snp.makeConstraints { maker in
            maker.top.left.equalToSuperview().inset(12)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(12)
            maker.top.equalTo(photoLabel.snp.bottom).offset(12)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(100)
        }
    }
}

