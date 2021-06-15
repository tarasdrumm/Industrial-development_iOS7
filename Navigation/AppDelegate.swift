//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureAppApperance()
        print("Загрузка завершилась")
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(UIApplication.shared.backgroundTimeRemaining)
        // 1.7976931348623157e+308
    }
    
    private func configureAppApperance() {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
      
        let feedViewController = FeedViewController()
        let logInViewController = LogInViewController()
        
        feedViewController.title = "Feed"
        logInViewController.title = "Profile"
        
        let feedNavigationViewController = UINavigationController(rootViewController: feedViewController)
        let logInNavigationViewController = UINavigationController(rootViewController: logInViewController)
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([feedNavigationViewController, logInNavigationViewController], animated: true)

        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
    }
}

