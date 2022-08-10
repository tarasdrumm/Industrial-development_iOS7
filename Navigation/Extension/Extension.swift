//
//  Extension.swift
//  Navigation
//
//  Created by Тарас Андреев on 07.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

// MARK: Localized
extension String {
    func localized(file: String) -> String {
        NSLocalizedString(self, tableName: file, bundle: Bundle.main, value: self, comment: "")
    }
}

// MARK: light/dark theme
extension UIColor {
    static func createThemeColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { traitCollection -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}
