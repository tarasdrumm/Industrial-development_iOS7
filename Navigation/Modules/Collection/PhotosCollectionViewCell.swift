//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Тарас Андреев on 04.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var photosImageView: UIImageView = {
        let photos = UIImageView()
        photos.contentMode = .scaleAspectFill
        photos.clipsToBounds = true
        
        return photos
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(imageName: String) {
        photosImageView.image = UIImage(named: imageName)
    }
}

private extension PhotosCollectionViewCell {
    func setupViews() {
        
        contentView.addSubview(photosImageView)
        photosImageView.snp.makeConstraints { maker in
            maker.top.bottom.left.equalToSuperview()
            maker.height.equalTo(photosImageView)
            maker.width.equalTo(contentView)
        }
    }
}
