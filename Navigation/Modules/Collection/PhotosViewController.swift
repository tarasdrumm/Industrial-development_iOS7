//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Тарас Андреев on 04.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

final class PhotosViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentMode = .scaleAspectFill
        collectionView.clipsToBounds = true
        
        return collectionView
    }()
    
    let viewModel = ["Image1","Image2","Image3","Image4","Image5",
                     "Image6","Image7","Image8","Image9","Image10",
                     "Image11","Image12","Image13","Image14","Image15",
                     "Image16","Image17","Image18","Image19","Image20"]
    
    let cellId = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.backgroundColor
        setupViews()
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setupViews() {
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(16)
            maker.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        let photoGalleryTitle = "photoGalleryTitle".localized(file: "LocalizationProfileViewController")
        title = photoGalleryTitle
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let imageName = viewModel[indexPath.row]
        (cell as! PhotosCollectionViewCell).setup(imageName: imageName)
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var baseInset: CGFloat { return 5 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.size.width - baseInset * 4) / 3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return baseInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return baseInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: .zero, left: baseInset, bottom: .zero, right: baseInset)
    }
}
