//
//  FeedPost.swift
//  Navigation
//
//  Created by Тарас Андреев on 23.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

struct FeedPost {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

struct PostSection {
    var title: String? = nil
    let posts: [FeedPost]
    var footer: String? = nil
}

struct Photos {
    static let images = [
        "Image1", "Image2", "Image3", "Image4"
    ]
}

struct Storage {
static let tableModel = [
    PostSection(
        posts: [
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
        )])
    ]
}
