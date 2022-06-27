//
//  ProfileModel.swift
//  Navigation
//
//  Created by Тарас Андреев on 23.06.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import RealmSwift

class ProfileModel: Object {
    @Persisted var login: String
}
