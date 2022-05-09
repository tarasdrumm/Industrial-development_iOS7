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
    
    func todos(completion: @escaping (String) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else {
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                guard let objects = jsonObject as? [Any] else {
                    return
                }
                guard let object = objects.first as? [String: Any] else {
                    return
                }
                guard let title = object["title"] as? String else {
                    return
                }

                DispatchQueue.main.async {
                    completion(title)
                }
                print(title)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func planets(completion: @escaping (String) -> Void) {
        let session = URLSession.shared
        guard let planetURL = URL(string: "https://swapi.dev/api/planets/1") else {
            return
        }
        let planetTask = session.dataTask(with: planetURL) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let planet = try JSONDecoder().decode(Planet.self, from: data)
                
                DispatchQueue.main.async {
                    completion(planet.orbitalPeriod)
                }
                print(planet.orbitalPeriod)
            }
            catch {
                print(error)
            }
        }
        planetTask.resume()
    }
}
