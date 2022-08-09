//
//  FeedFactory.swift
//  Navigation
//
//  Created by Тарас Андреев on 10.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedFactory {
    static func build() -> UIViewController {
        let output = PostPresenter()
        let feedViewController = FeedViewController(output: output)
        feedViewController.title = "feedViewControllerTitle".localized(file: "LocalizationTabBar")
        return feedViewController
    }
}
