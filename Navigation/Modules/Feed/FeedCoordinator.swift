//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Тарас Андреев on 22.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedCoordinator {
    
    //MARK: Properties
    
    private var navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
    }
    
    func initialize() -> UIViewController {
        let viewController = FeedFactory.build()
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
}
