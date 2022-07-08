//
//  PostsFactory.swift
//  Navigation
//
//  Created by Тарас Андреев on 08.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class PostsFactory {
    static func build() -> UIViewController {
        //let output = LikedPostPresenter()
        let likedPostsVC = LikedPostsViewController()
        likedPostsVC.title = "Liked Posts"
        return likedPostsVC
    }
}
