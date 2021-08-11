//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show alert", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupButton()
    }
    
    private func setupButton() {
        
        view.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.equalTo(40)
            maker.width.equalTo(70)
        }
    }
    
    // MARK: Actions
    
    @objc private func deleteButtonTapped() {
        
        let alertController = UIAlertController(title: "Удалить пост?", message: "Пост нельзя будет восстановить", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Удалить")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

