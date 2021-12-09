//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Тарас Андреев on 23.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

final class LoginViewModel {
    
    // MARK: Properties
    
    var loginInput: String?
    var passwordInput: String?
        
    // MARK: Dependencies
    
    private let delegate: LoginViewControllerDelegate
    private let coordinator: LoginCoordinator
    
    // MARK: Init
    
    init(
        delegate: LoginViewControllerDelegate,
        coordinator: LoginCoordinator
    ) {
        self.delegate = delegate
        self.coordinator = coordinator
    }
    
    // MARK: Interface
    
    func didTapLoginButton() {
        let isValid = delegate.validate(login: loginInput) && delegate.validate(password: passwordInput)
        coordinator.showNext(isError: !isValid)
    }
}
