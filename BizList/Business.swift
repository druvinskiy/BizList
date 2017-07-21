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
    let tasks: String
    let addresses: [String]
    let phones: [String]
    let zips: [String]
    let logo: UIImage
    let pic1: UIImage?
    let pic2: UIImage?
    var isFavorite: Bool
    
    init(name: String, locations: [String], tiers: [String], tasks: String, addresses: [String], phones: [String], zips: [String], logo: UIImage, pic1: UIImage, pic2: UIImage, isFavorite: Bool) {
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
    
    class func createBusinessArray() -> [Business] {
        var businesses: [Business] = []
        
        let marriott = Business(name: "Marriott",
                                locations: ["Schaumburg"],
                                tiers: ["Tier 2"],
                                tasks: "Cleaning, Food Service, Laundry, Recycling",
                                addresses: ["50 N Martingale Rd."],
                                phones: ["847-224-5631"],
                                zips: ["60173"],
                                logo: #imageLiteral(resourceName: "Marriott"),
                                pic1: #imageLiteral(resourceName: "FalseImage"),
                                pic2: #imageLiteral(resourceName: "FalseImage"),
                                isFavorite: false)
        
        businesses.append(marriott)
        
        return businesses.sorted(by: { (biz0: Business, biz1: Business) -> Bool in
            return biz0.name < biz1.name
        })
    }
    
    class func getFilteredBusinesses(businesses: [Business], index: Int, filter: String) -> [Business] {
        var filteredBusinesses:[Business] = []
        
        for business in businesses {
            switch index {
            case 1:
                if business.locations.contains(filter) {
                    filteredBusinesses.append(business)
                }
                break
            case 2:
                if business.tiers.contains(filter) {
                    filteredBusinesses.append(business)
                }
                break
            case 3:
                if business.tasks.contains(filter) {
                    filteredBusinesses.append(business)
                }
                break
            case 4:
                if business.isFavorite {
                    filteredBusinesses.append(business)
                }
                break
            default:
                break
            }
            
        }
        
        return filteredBusinesses
    }
    
    class func getFavorites(businesses: [Business]) -> [Business] {
        var favorites:[Business] = []
        
        for business in businesses {
            if business.isFavorite {
                favorites.append(business)
            }
        }
        
        return favorites
    }
    
    func createPic1(business: Business) -> UIImage {
        var image = #imageLiteral(resourceName: "FalseImage")
        
        if business.pic1 != nil {
            image = business.pic1!
        }
        
        return image
    }
    
    func createPic2(business: Business) -> UIImage {
        var image = #imageLiteral(resourceName: "FalseImage")
        
        if business.pic2 != nil {
            image = business.pic2!
        }
        
        return image
    }
    
    func createAddresses(business: Business) -> String {
        var bizAddresses = "Address:"
        
        for (index, address) in addresses.enumerated() {
            let city = business.locations[index]
            let zip = business.zips[index]
            
            bizAddresses = "\(bizAddresses)\n\n\(address), \(city), IL \(zip)"
        }
        
        return bizAddresses
    }
    
    func createPhoneNumbers(business: Business) -> String {
        var bizPhones = "Phone Number:"
        
        for phone in phones {
            bizPhones = "\(bizPhones)\n\n\(phone)"
        }
        
        return bizPhones
    }
    
    func createTiers(business: Business) -> String {
        var bizTiers = "Tier:"
        
        for tier in business.tiers {
            bizTiers = "\(bizTiers)\n\n\(tier)";
        }
        
        return bizTiers
    }
    
    func createTasks(business: Business) -> String {
        return "Tasks:\n\n\(business.tasks)"
    }
}
