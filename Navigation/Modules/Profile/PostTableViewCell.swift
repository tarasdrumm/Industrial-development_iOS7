//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Тарас Андреев on 23.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    private let postImageView: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.clipsToBounds = false
        postImage.backgroundColor = .black
        
        return postImage
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        description.textColor = .systemGray
        description.numberOfLines = 0
        
        return description
    }()
    
    private let likesLabel: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        
        return likes
    }()
    
    private let viewsLabel: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        
        return views
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func configure(post: FeedPost) {
        authorNameLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    private func setupLayout() {
        
        contentView.addSubview(authorNameLabel)
        authorNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(16)
            maker.left.right.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().inset(16)
            maker.left.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(viewsLabel)
        viewsLabel.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { maker in
            maker.bottom.equalTo(likesLabel.snp.top).offset(-16)
            maker.left.right.equalToSuperview().inset(16)
        }

        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { maker in
            maker.top.equalTo(authorNameLabel.snp.bottom).offset(12)
            maker.left.right.equalToSuperview()
            maker.bottom.equalTo(descriptionLabel.snp.top).offset(-16)
        }
    }
}
