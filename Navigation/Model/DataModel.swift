//
//  DataModel.swift
//  Navigation
//
//  Created by Тарас Андреев on 19.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct DataModel: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
