//
//  PostPresenter.swift
//  Navigation
//
//  Created by Тарас Андреев on 10.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostPresenter {
    var navigationController: UINavigationController?
}

// MARK: - FeedViewOutput
extension PostPresenter: FeedViewOutput {
    
    func showPost() {
        let viewController = PostViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
