//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Тарас Андреев on 01.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
   
    // MARK: Subviews
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    let photosVC = PhotosViewController()
    
    // MARK: Properties
    
    private let photos = ["Image1", "Image2", "Image3", "Image4"]
    private let postsViewModel = [
        FeedPost(
            author: "Manchester United",
            description: "«Манчестер Юнайтед» переиграл «Фулхэм» в матче 18-го тура чемпионата Англии (2:1). Нападающий Адемола Лукман на 5-й минуте вывел «дачников» вперед. Спустя некоторое время Эдинсон Кавани сравнял счет. После перерыва Поль Погба забил гол, который стал победным.«Манчестер Юнайтед» поднялся на первое место в турнирной таблице. «Фулхэм» потерпел второе поражение кряду и занимает 18-ю строчку.",
            image: "manchester-united",
            likes: 5674,
            views: 6234
        ),
        FeedPost(
            author: "FanClub Manchtster United ",
            description: "Как сообщает статистический портал Opta, в матче 18-го тура АПЛ с «Фулхэмом» Эдинсону Кавани покорилось уникальное достижение. Забив на 21-й минуте, уругваец стал первым игроком «МЮ», сумевшим забить первые четыре гола за клуб исключительно в выездных матчах. Кроме «Фулхэма» он забивал «Эвертону» и «Саутгемптону».",
            image: "Kavani",
            likes: 4376,
            views: 5400
        ),
        FeedPost(
            author: "UFC",
            description: "Российский тяжеловес Александр Волков проведет свой следующий бой против Алистара Оверима. Поединок состоится 6 февраля следующего года и станет главным событием шоу. Новость сообщил глава UFC Дана Уайт для ESPN.",
            image: "Volkov2",
            likes: 3400,
            views: 4231
        ),
        FeedPost(
            author: "UFC",
            description: "23 января на «Бойцовском острове», расположенном в прибрежных водах Абу-Даби (ОАЭ), состоится первый номерной турнир UFC (257) 2021 года. В главном событии ивента в матче-реванше встретятся Конор Макгрегор и Дастин Порье. Но главной интригой станет присутствие во «Флэш Форуме» команды Хабиба Нурмагомедова.",
            image: "UFC257",
            likes: 5200,
            views: 5432
        )
    ]
    
    // MARK: Cell identifiers
    
    private let postCellId = "PostCellId"
    private let photosCellId = "PhotosCellId"
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postCellId)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellId)
        tableView.dataSource = self
        tableView.delegate = self
    
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

 // MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : postsViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell
    
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: photosCellId, for: indexPath)
            (cell as? PhotosTableViewCell)?.setup(imageNames: photos)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: postCellId, for: indexPath)
            let post = postsViewModel[indexPath.row]
            (cell as? PostTableViewCell)?.configure(post: post)
        }
        
        return cell
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
        tableView.deselectRow(at: indexPath, animated: true)
        show(photosVC, sender: nil)
    }
}

