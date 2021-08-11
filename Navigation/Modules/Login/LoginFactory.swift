//
//  LoginFactory.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

// Pattern Factory

final class LoginFactory {
    
    static func build() -> UIViewController {
     
        let logInViewController = LogInViewController()
        let loginInspector = LoginInspector()
        
        logInViewController.title = "Profile"
        logInViewController.delegate = loginInspector
        
        return logInViewController
    }
}
