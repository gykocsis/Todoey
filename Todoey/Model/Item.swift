//
//  Item.swift
//  Todoey
//
//  Created by Kocsis György on 2019. 02. 17..
//  Copyright © 2019. Jolakotturinn. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated = Date()

    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
