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
    
    func showLogIn(logInError: Bool) {
        if logInError {
            showLogInError()
        } else {
            showProfile()
        }
    }
    
    // MARK: Convenience
    
    func showProfile(animated: Bool = true) {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: animated)
    }
 
    private func showValidationError() {
        let validationTitle = "validationTitle".localized(file: "LocalizationLoginViewController")
        let alertController = UIAlertController(
            title: validationTitle,
            message: nil,
            preferredStyle: .alert
        )
        let okActionTitle = "okActionTitle".localized(file: "LocalizationLoginViewController")
        let okAction = UIAlertAction(title: okActionTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    private func showLogInError() {
        let userRegisterTitle = "userRegisterTitle".localized(file: "LocalizationLoginViewController")
        let alertController = UIAlertController(
            title: userRegisterTitle,
            message: nil,
            preferredStyle: .alert
        )
        
        let tryAgainActionTitle = "tryAgainActionTitle".localized(file: "LocalizationLoginViewController")
        let tryAgainAction = UIAlertAction(title: tryAgainActionTitle, style: .default, handler: nil)
        alertController.addAction(tryAgainAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
