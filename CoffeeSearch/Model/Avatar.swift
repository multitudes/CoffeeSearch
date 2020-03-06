//
//  Avatar.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 03/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import Foundation

struct Avatar: Codable, Hashable {
    
    let coffeeName: String
    let imageSmall: String
    let roaster: String?
    let title: String?
    let category: String?
    let preparation: String?
    let region: String?
    let flavour: String?
    let productLink: String?
    }
