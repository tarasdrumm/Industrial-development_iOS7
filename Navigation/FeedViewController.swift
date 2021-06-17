//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Open post", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setupButton()
        setupNavigationBar()
        setupTabBarItemsImage()
    }
    
    private func setupButton() {
       
        view.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.equalTo(40)
            maker.width.equalTo(70)
        }
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Feed"
        
    }
    
    private func setupTabBarItemsImage() {
        
        guard let items = tabBarController?.tabBar.items else {
            return
        }

        let images = ["house.fill", "person.fill"]

        for i in 0...1 {
            items[i].image = UIImage(systemName: images[i])
        }
    }
    
    // MARK: Actions
    
    @objc func buttonTaped() {
        let postVC = PostViewController()
        show(postVC, sender: nil)
    }
}
