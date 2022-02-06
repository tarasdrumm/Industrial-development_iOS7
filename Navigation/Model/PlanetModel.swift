//
//  PlanetModel.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct Planet: Decodable, Encodable {
    
    let orbitalPeriod: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case orbitalPeriod = "orbital_period"
        case name = "name"
    }
}

struct User: Decodable {
    
    let name: Int
}
