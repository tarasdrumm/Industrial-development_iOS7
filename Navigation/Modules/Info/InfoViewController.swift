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
    
    let service = NetworkService()
    
    // MARK: Subviews
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show alert", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    private let orbitalPeriodLabel: UILabel = {
        let orbitalPeriodLabel = UILabel()
        orbitalPeriodLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return orbitalPeriodLabel
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupLayout()
        setupURLSession()
        setupPlanetURL()
    }
    
    // MARK: Задача 1 (JSONSerialization)
    
    private func setupURLSession() {
        service.todos { title in
            self.titleLabel.text = title
        }
    }
    
    // MARK: Задача 2 (JSONDecoder)
    
    private func setupPlanetURL() {
        service.planets { label in
            self.orbitalPeriodLabel.text = label
        }
    }
    
    //MARK: Convenience
    
    private func setupLayout() {
        
        view.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(button.snp.bottom).offset(10)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        view.addSubview(orbitalPeriodLabel)
        orbitalPeriodLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
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

