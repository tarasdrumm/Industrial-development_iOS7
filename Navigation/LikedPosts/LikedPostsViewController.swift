//
//  LikedPostsViewController.swift
//  Navigation
//
//  Created by Тарас Андреев on 08.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import CoreData
import SwiftUI

class LikedPostsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: String(describing: PostTableViewCell.self)
        )
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    private func getLikedPosts() -> [LikedPosts] {
        let coreDataStack = CoreDataStack()
        return coreDataStack.fetchLikedPosts()
    }
}

extension LikedPostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let likedPosts = self.getLikedPosts()
        return likedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        let likedPosts = self.getLikedPosts()
        let likedPost = likedPosts[indexPath.row]
        let post = FeedPost(author: likedPost.postAuthor,
                             description: likedPost.postDescription,
                             image: likedPost.postImage,
                             likes: Int(likedPost.postLikes),
                             views: Int(likedPost.postViews))
        
        cell.post = post
        
        return cell
    }
}

