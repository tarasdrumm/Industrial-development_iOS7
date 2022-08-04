//
//  MapFactory.swift
//  Navigation
//
//  Created by Тарас Андреев on 03.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class MapFactory {
    static func build() -> UIViewController {
        let mapVC = MapViewController()
        mapVC.title = "Map"
        return mapVC
    }
}
