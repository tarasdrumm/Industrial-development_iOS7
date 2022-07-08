//
//  PostsCoordinator.swift
//  Navigation
//
//  Created by Тарас Андреев on 08.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

final class PostsCoordinator {
    
    //MARK: Properties
    
    private let navigationController: UINavigationController

    init() {
        navigationController = UINavigationController()
    }
    
    func initialize() -> UIViewController {
        let viewController = PostsFactory.build()
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
}
