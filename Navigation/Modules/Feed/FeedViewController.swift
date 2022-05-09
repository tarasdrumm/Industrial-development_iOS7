//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

protocol FeedViewOutput {
    var navigationController: UINavigationController? { get set }
    func showPost()
}

final class FeedViewController: UIViewController {
    
    // MARK: Dependencies
    
    var output: FeedViewOutput
    
    // MARK: Subviews
    
    private let containerView = ContainerView()
    
    // MARK: Init
    
    init(output: FeedViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.navigationController = navigationController
        view.backgroundColor = .white
        setupSubviews()
        setupNavigationBar()
        setupTabBarItemsImage()
    }
    
    // MARK: Drawing
    
    private func setupSubviews() {
       
        containerView.onTap = { [weak self] in
            self?.output.showPost()
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.height.equalTo(40)
            maker.width.equalTo(70)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupTabBarItemsImage() {
        ["house.fill", "person.fill"]
            .enumerated()
            .forEach { (index, imageName) in
                tabBarController?.tabBar.items?[index].image = UIImage(systemName: imageName)
            }
    }
}
