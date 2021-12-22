//
//  AppConfiguration.swift
//  Navigation
//
//  Created by Тарас Андреев on 16.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    case urlString(String)
    case url(URL)
    
    var url: URL? {
        switch self {
        case let .urlString(string):
            return URL(string: string)
        case let .url(url):
            return url
        }
    }
}
