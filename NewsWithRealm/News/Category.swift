//
//  Category.swift
//  News
//
//  Created by Cesar Brenes on 5/18/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import RealmSwift


class Category: Object {
    dynamic var name = ""
    dynamic var imageName = ""
    dynamic var type = 0
    let news = List<News>()
}
