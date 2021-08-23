//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Тарас Андреев on 22.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class LoginCoordinator {
    
    //MARK: Properties
    
    private var navigationController: UINavigationController?
    
    //MARK: Interface
    
    func initialize() -> UIViewController {
        let viewController = LoginFactory.build(coordinator: self)
        navigationController = UINavigationController(rootViewController: viewController)
        
        return navigationController!
    }
    
    func showNext(isError: Bool) {
        if isError {
            showValidationError()
        } else {
            showProfile()
        }
    }
    
    // MARK: Convenience
    
    private func showProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func showValidationError() {
        let alertController = UIAlertController(
            title: "Validation error",
            message: nil,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
