//
//  PostViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class PostViewController: UIViewController {
    
    var timer = Timer()
    var second = 10
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        statusLabel.textColor = .black
        
        return statusLabel
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGray
        button.setTitle("Обновить данные", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLayout()
        
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        
        title = "Пост"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showAlert))
    }
    
    private func setupLayout() {
        
        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            maker.height.equalTo(30)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
            
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { maker in
            maker.top.equalTo(statusLabel.snp.bottom).offset(5)
            maker.height.equalTo(30)
            maker.width.equalTo(30)
            maker.centerX.equalToSuperview()
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { maker in
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            maker.height.equalTo(50)
            maker.width.equalTo(150)
            maker.centerX.equalToSuperview()
        }
    }
    
    @objc private func showAlert() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
    
    // MARK: Time interval
    
    @objc func timerAction() {
        second -= 1
        timeLabel.text = "\(second)"
        print(second)
        
        if second == 0 {
            statusLabel.text = "Данные обновлены"
            timer.invalidate()
        }
    }
    
    // MARK: Start timer
    
    @objc private func buttonTapped() {
        second = 11
        timer.invalidate()
        statusLabel.text = "Идет обновление"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
}
