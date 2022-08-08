//
//  Extension.swift
//  Navigation
//
//  Created by Тарас Андреев on 07.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

extension String {
    func localized(file: String) -> String {
        NSLocalizedString(self, tableName: file, bundle: Bundle.main, value: self, comment: "")
    }
}
