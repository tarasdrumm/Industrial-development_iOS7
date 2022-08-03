//
//  MapCoordinator.swift
//  Navigation
//
//  Created by Тарас Андреев on 03.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

final class MapCoordinator {
    
    //MARK: Properties
    
    private var navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
    }
    
    func initialize() -> UIViewController {
        let viewController = MapFactory.build()
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
}
