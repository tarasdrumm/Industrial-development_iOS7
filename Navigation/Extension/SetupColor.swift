//
//  SetupColor.swift
//  Navigation
//
//  Created by Тарас Андреев on 10.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

struct SetupColor {
    
    // Фон экрана Feed/InfoViewController/LogIn/PhotoGallery/LikedPosts/Map
    static var backgroundColor = UIColor.createThemeColor(lightMode: .white, darkMode: .black)
    
    // Цвет кнопок в NavBar
    static var navigationBarColorButton = UIColor.createThemeColor(lightMode: #colorLiteral(red: 0.2823528945, green: 0.5215686275, blue: 0.8000000119, alpha: 1), darkMode: .white)
    
    // Цвет tabBar иконок
    static var tabBarItem = UIColor.createThemeColor(lightMode: #colorLiteral(red: 0.2823528945, green: 0.5215686275, blue: 0.8000000119, alpha: 1), darkMode: .white)

    // Фон stackView
    static var stackView = UIColor.createThemeColor(lightMode: .systemGray6, darkMode: .systemGray6)
    
    // Цвет текста кнопок/photoLabel в ячейке/идет обновление/таймер/Имя пользователя на экране profile
    static var textColor = UIColor.createThemeColor(lightMode: .black, darkMode: .white)
    
    // Кнопки Register/LogIn/ShowStatus
    static var buttonColor = UIColor.createThemeColor(lightMode: UIColor(named: "colorButton")!, darkMode: UIColor(named: "colorButton")!)
    
    // Цвет statusTextField и statusLabel
    static var statusColor = UIColor.createThemeColor(lightMode: .gray, darkMode: .white)
    
    // BackgroundColor statusTextField и statusLabel
    static var statusBackgroundColor = UIColor.createThemeColor(lightMode: .white, darkMode: .systemGray6)
    
    // Цвет текста в постах
    static var textColorPosts = UIColor.createThemeColor(lightMode: .black, darkMode: .white)

    // Цвет курсора TextField
    static var cursorColor = UIColor.createThemeColor(lightMode: .darkGray, darkMode: .white)
    
}
