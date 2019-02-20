//
//  Category.swift
//  Todoey
//
//  Created by Kocsis György on 2019. 02. 17..
//  Copyright © 2019. Jolakotturinn. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
