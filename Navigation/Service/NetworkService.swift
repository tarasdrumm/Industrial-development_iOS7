//
//  NetworkService.swift
//  Navigation
//
//  Created by Тарас Андреев on 09.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class NetworkService {
    
    static func dataTask(configuration: AppConfiguration) {
      
        guard let url = configuration.url else {
            return
        }
        
        URLSession.shared.dataTask(
            with: url
        ) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("AllHeaderFields: \(response.allHeaderFields)")
                print("StatusCode: \(response.statusCode)")
            }
            if let data = data, let stringData = String(data: data, encoding: .utf8) {
                print("Data: \(stringData)")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
