//
//  LikedPosts+CoreDataProperties.swift
//  
//
//  Created by Тарас Андреев on 08.07.2022.
//
//

import Foundation
import CoreData


extension LikedPosts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LikedPosts> {
        return NSFetchRequest<LikedPosts>(entityName: "LikedPosts")
    }

    @NSManaged public var id: UUID
    @NSManaged public var postAuthor: String
    @NSManaged public var postDescription: String
    @NSManaged public var postImage: String
    @NSManaged public var postLikes: Int16
    @NSManaged public var postViews: Int16

}

extension LikedPosts : Identifiable {

}
