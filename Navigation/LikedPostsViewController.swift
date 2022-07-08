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

        self.title = "Liked Posts"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}
    
