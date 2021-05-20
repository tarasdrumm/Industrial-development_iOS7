//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Тарас Андреев on 04.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var photosImageView: UIImageView = {
        let photos = UIImageView()
        photos.contentMode = .scaleAspectFill
        photos.clipsToBounds = true
        photos.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        let constraints = [
            photosImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photosImageView.heightAnchor.constraint(equalTo: photosImageView.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
