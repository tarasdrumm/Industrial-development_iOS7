//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Тарас Андреев on 22.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import FirebaseAuth

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
        let postsCoordinator = PostsCoordinator()
        let mapViewCoordinator = MapCoordinator()
        
        tabBarController = UITabBarController()
        tabBarController?.tabBar.isHidden = false
        tabBarController?.setViewControllers([feedCoordinator.initialize(), loginCoordinator.initialize(), postsCoordinator.initialize(), mapViewCoordinator.initialize()],animated: true)
        
        if Auth.auth().currentUser != nil {
            loginCoordinator.showProfile(animated: false)
        }

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
