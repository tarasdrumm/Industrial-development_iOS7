//
//  PostViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        view.backgroundColor = .systemPink
    }
    
    private func setupNavigationBar() {
        
        title = "Пост"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showAlert))
    }
    
    @objc private func showAlert() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
