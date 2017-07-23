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
                                tiers: ["2"],
                                tasks: "Cleaning, Food Service, Laundry, Recycling",
                                addresses: ["50 N Martingale Rd."],
                                phones: ["847-224-5631"],
                                zips: ["60173"],
                                logo: #imageLiteral(resourceName: "Marriott"),
                                pic1: #imageLiteral(resourceName: "FalseImage"),
                                pic2: #imageLiteral(resourceName: "FalseImage"),
                                isFavorite: false)
        
        let ikea = Business(name: "IKEA",
                            locations: ["Schaumburg"],
                            tiers: ["1"],
                            tasks: "Cleaning, Sorting, Stocking, Food Service, Building, Facing, Recycling",
                            addresses: ["1800 East McConnor Pkwy"],
                            phones: ["888-888-4532"],
                            zips: ["60173"],
                            logo: #imageLiteral(resourceName: "IKEA"),
                            pic1: #imageLiteral(resourceName: "IKEA Pic 1"),
                            pic2: #imageLiteral(resourceName: "IKEA Pic 2"),
                            isFavorite: false)
        
        let walgreens = Business(name: "Walgreens",
                                 locations: ["Arlington Heights", "Arlington Heights", "Prospect Heights", "Buffalo Grove", "Wheeling"],
                                 tiers: ["2", "2", "2", "2", "2"],
                                 tasks: "Cleaning, Stocking, Sales",
                                 addresses: ["1711 W. Campbell St.", "3 E. Golf Rd.", "1 N. Elmhurst Rd.", "15 N. Buffalo Grove Rd.", "1199 W. Dundee Rd."],
                                 phones: ["847-520-7220", "847-398-4673", "847-465-8682", "847-577-7099", "847-593-6650"],
                                 zips: ["60005", "60005", "60070", "60089", "60090"],
                                 logo: #imageLiteral(resourceName: "Walgreens"),
                                 pic1: #imageLiteral(resourceName: "Walgreens Pic 1"),
                                 pic2: #imageLiteral(resourceName: "Walgreens Pic 2"),
                                 isFavorite: false)
        
        businesses = [marriott, ikea, walgreens]
        
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
    
    func createAddress(business: Business, index: Int) -> String {
        let address = business.addresses[index]
        let city = business.locations[index]
        let zip = business.zips[index]
        
        return "Address: \(address), \(city), IL \(zip)\n\n"
    }
    
    func createPhoneNumber(business: Business, index: Int) -> String {
        return "Phone Number: \(business.phones[index])\n\n"
    }
    
    func createTier(business: Business, index: Int) -> String {
        return "Tier: \(business.tiers[index])"
    }
    
    func createTasks(business: Business) -> String {
        return "\(business.tasks)"
    }
}
