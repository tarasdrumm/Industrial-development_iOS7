//
//  LoginFactory.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class LoginFactory {
    
    static func build(coordinator: LoginCoordinator) -> UIViewController {
     
        let logInViewController = LogInViewController()
        let loginInspector = LoginInspector()
        let viewModel = LoginViewModel(delegate: loginInspector, coordinator: coordinator)
        viewModel.vc = logInViewController
        
        logInViewController.title = "Profile"
       
        logInViewController.viewModel = viewModel
        
        return logInViewController
    }
}
