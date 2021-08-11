//
//  LoginInspector.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

final class LoginInspector {
    
    init() {
        print("Inspector init")
    }
    
    deinit {
        print("Inspector deinit")
    }
}

// MARK: - LoginViewControllerDelegate
extension LoginInspector: LoginViewControllerDelegate {
    
    func validate(login: String?) -> Bool {
        AuthorizationCheckerSingltone.shared.validLogin == login
    }
    
    func validate(password: String?) -> Bool {
        AuthorizationCheckerSingltone.shared.validPassword == password
    }
}
