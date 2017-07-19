//
//  Business.swift
//  BizList
//
//  Created by David Ruvinskiy on 7/18/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class Business: NSObject {
    let name: String
    let locations: [String]
    let tiers: [String]
    let tasks: [String]
    let addresses: [String]
    let phones: [String]
    let zips: [String]
    let logo: UIImage
    let pic1: UIImage
    let pic2: UIImage
    let isFavorite: Bool
    
    init(name: String, locations: [String], tiers: [String], tasks: [String], addresses: [String], phones: [String], zips: [String], logo: UIImage, pic1: UIImage, pic2: UIImage, isFavorite: Bool) {
        self.name = name
        self.locations = locations
        self.tiers = tiers
        self.tasks = tasks
        self.addresses = addresses
        self.phones = phones
        self.zips = zips
        self.logo = logo
        self.pic1 = pic1
        self.pic2 = pic2
        self.isFavorite = isFavorite
    }
}
