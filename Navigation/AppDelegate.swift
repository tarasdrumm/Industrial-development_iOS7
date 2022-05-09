//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.initialize()
        
        NetworkService.dataTask(configuration: .urlString("https://swapi.dev/api/people/8"))
        NetworkService.dataTask(configuration: .urlString("https://swapi.dev/api/starships/3"))
        NetworkService.dataTask(configuration: .urlString("https://swapi.dev/api/planets/5"))
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(UIApplication.shared.backgroundTimeRemaining)
        // 1.7976931348623157e+308
    }
}

