//
//  AuthorizationCheckerSingltone.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

final class AuthorizationCheckerSingltone {
    
    //MARK: Singltone
    
    static let shared = AuthorizationCheckerSingltone()
    
    let validLogin = "taras"
    let validPassword = "1234"
    
    private init() { }
}
