//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Тарас Андреев on 22.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    //MARK: Properties
    
    private let window: UIWindow
    private var tabBarController: UITabBarController?
    
    //MARK: Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: Interface
    
    func initialize() {
       
        guard tabBarController == nil else {
            return
        }
            
        let feedCoordinator = FeedCoordinator()
        let loginCoordinator = LoginCoordinator()
                    
        tabBarController = UITabBarController()
        tabBarController?.setViewControllers([feedCoordinator.initialize(), loginCoordinator.initialize()],animated: true)

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
