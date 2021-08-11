//
//  ContainerView.swift
//  Navigation
//
//  Created by Тарас Андреев on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class ContainerView: UIView {
  
    // MARK: Public properties
    
    var onTap: (() -> Void)?
    
    // MARK: Subviews
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Open post", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        
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
        button.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    // MARK: Actions
    
    @objc private func buttonTaped() {
        onTap?()
    }
}
