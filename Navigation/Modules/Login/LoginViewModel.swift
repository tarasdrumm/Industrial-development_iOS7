//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Тарас Андреев on 23.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import FirebaseAuth

final class LoginViewModel {
    
    // MARK: Properties
    
    var loginInput: String?
    var passwordInput: String?
        
    // MARK: Dependencies
    
    private let delegate: LoginViewControllerDelegate
    private let coordinator: LoginCoordinator
    weak var vc: LogInViewController?
    
    // MARK: Init
    
    init(
        delegate: LoginViewControllerDelegate,
        coordinator: LoginCoordinator
    ) {
        self.delegate = delegate
        self.coordinator = coordinator
    }
    
    // MARK: Interface
    
    func didTapRegisterButton() {
        
        guard let loginInput = loginInput, !loginInput.isEmpty, let passwordInput = passwordInput, !passwordInput.isEmpty else {
            self.coordinator.showNext(isError: true)
            return
        }

        Auth.auth().createUser(withEmail: loginInput, password: passwordInput) { [weak self] result, error in
            if error == nil {
                self?.vc?.clearFields()
            }
            self?.coordinator.showNext(isError: error != nil)
        }
    }
    
    func didTapLoginButton() {
       
        guard let loginInput = loginInput, !loginInput.isEmpty, let passwordInput = passwordInput, !passwordInput.isEmpty else {
            self.coordinator.showLogIn(logInError: true)
            return
        }

        Auth.auth().signIn(withEmail: loginInput, password: passwordInput) { [weak self] result, error in
            if error == nil {
                self?.vc?.clearFields()
            }
            self?.coordinator.showLogIn(logInError: error != nil)
        }
    }
}
