//
//  ContainerView.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

final class ContainerView: UIView {
  
    // MARK: Public properties
    
    var onTap: (() -> Void)?
    
    // MARK: Subviews
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Open post", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private let label = UILabel()
    
    // MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Drawing
    
    private func setupSubviews() {
        addSubview(button)
        button.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(150)
            maker.height.equalTo(50)
        }
    }
    
    // MARK: Actions
    
    @objc private func buttonTaped() {
        onTap?()
    }
}
