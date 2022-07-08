//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Тарас Андреев on 01.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseAuth
import RealmSwift
import CoreData

final class ProfileViewController: UIViewController {
    
    private var onDoubleTapped: (() -> Void)?

    var coreDataStack: CoreDataStack!
   
    // MARK: Subviews
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    let photosVC = PhotosViewController()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRealm()
        setupTableView()
        setupSubviews()
        setupNavigationBar()
    }
    
    private func setupRealm() {
        let realm = try! Realm()
        if let profileModel = realm.objects(ProfileModel.self).first {
            title = profileModel.login
            print(realm.objects(ProfileModel.self))
        }
        else {
            title = "Profile"
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(signOutButtonTapped))
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            PhotosTableViewCell.self,
            forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: String(describing: PostTableViewCell.self)
        )
    }
    
    private func setupSubviews() {

        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    @objc private func signOutButtonTapped() {
        do {
            try Auth.auth().signOut()
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll()
            }
            self.navigationController?.popToRootViewController(animated: true)
        } catch let error {
            print("Failed to sign out with error", error)
        }
    }
}

 // MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            let tableSection: PostSection = Storage.tableModel[section - 1]
            return tableSection.posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
                        
            return cell
        default:
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            
            let tableSection: PostSection = Storage.tableModel[indexPath.section - 1]
            let post: FeedPost = tableSection.posts[indexPath.row]
            
            cell.post = post
            cell.onDoubleTapped = { [weak self] post in
                self?.likedPosts(post: post)
            }
            return cell
        }
    }
    
    private func likedPosts(post: FeedPost) {
        let coreDataStack = CoreDataStack()
        coreDataStack.createNewLikedPost(post: post)
        print("Post is saved to Core Data")
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else {
            return nil
        }
        return ProfileTableHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else {
            return .zero
        }
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 0 else {
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(photosVC, animated: true)
    }
}
