//
//  Avatar.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 03/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import Foundation

struct Avatar: Codable, Hashable {
    
    var coffeeName: String
    var imageSmall: String
    var roaster: String?
    var title: String?
    var category: String?
    var preparation: String?
    var region: String?
    var flavour: String?
    var productLink: String?
    }
