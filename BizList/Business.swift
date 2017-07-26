//
//  Business.swift
//  BizList
//
//  Created by David Ruvinskiy on 7/18/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class Business: NSObject, NSCoding {
    var name: String
    var locations: [String]
    var tiers: [String]
    var tasks: String
    var addresses: [String]
    var phones: [String]
    var zips: [String]
    var categories: String
    var isFavorite: Bool
    
    init(name: String, locations: [String], tiers: [String], tasks: String, addresses: [String], phones: [String], zips: [String], categories: String) {
        self.name = name
        self.locations = locations
        self.tiers = tiers
        self.tasks = tasks
        self.addresses = addresses
        self.phones = phones
        self.zips = zips
        self.categories = categories
        self.isFavorite = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = (aDecoder.decodeObject(forKey: "name") as? String)!
        self.locations = (aDecoder.decodeObject(forKey: "locations") as? [String])!
        self.tiers = (aDecoder.decodeObject(forKey: "tiers") as? [String])!
        self.tasks = (aDecoder.decodeObject(forKey: "tasks") as? String)!
        self.addresses = (aDecoder.decodeObject(forKey: "addresses") as? [String])!
        self.phones = (aDecoder.decodeObject(forKey: "phones") as? [String])!
        self.zips = (aDecoder.decodeObject(forKey: "zips") as? [String])!
        self.categories = (aDecoder.decodeObject(forKey: "categories") as? String)!
        self.isFavorite = (aDecoder.decodeBool(forKey: "isFavorite"))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name");
        aCoder.encode(self.locations, forKey: "locations");
        aCoder.encode(self.tiers, forKey: "tiers");
        aCoder.encode(self.tasks, forKey: "tasks");
        aCoder.encode(self.addresses, forKey: "addresses");
        aCoder.encode(self.phones, forKey: "phones");
        aCoder.encode(self.zips, forKey: "zips");
        aCoder.encode(self.categories, forKey: "categories");
        aCoder.encode(self.isFavorite, forKey: "isFavorite");
    }
    
    class func createBusinessArray(alreadyExists:[Business]?=nil) -> [Business] {
        var alreadyExists = alreadyExists
        var businesses: [Business] = []
        
        let marriott = Business(name: "Marriott", locations: ["Schaumburg"], tiers: ["Tier 2"], tasks: "Cleaning, Food Service, Laundry, Recycling", addresses: ["50 N Martingale Rd"], phones: ["847-224-5631"], zips: ["60173"], categories: "Hotel")
        
        let ikea = Business(name: "IKEA", locations: ["Schaumburg"], tiers: ["Tier 2"], tasks: "Cleaning, Sorting, Stocking, Food Service, Building, Facing, Recycling", addresses: ["1800 E. McConnor Pkwy"], phones: ["888-888-4532"], zips: ["60173"], categories: "Retail, Restaurant")
        
        let walgreens = Business(name: "Walgreens", locations: ["Arlington Heights", "Arlington Heights", "Prospect Heights", "Buffalo Grove", "Wheeling"], tiers: ["Tier 1", "Tier 1", "Tier 1", "Tier 1", "Tier 1"], tasks: "Cleaning, Stocking, Customer Service", addresses: ["1711 W. Campbell St", "3 E. Golf Rd", "1 N. Elmhurst Rd", "15 N. Buffalo Grove Rd", "1199 W. Dundee Rd"], phones: ["847-520-7220", "847-398-4673", "847-465-8682", "847-577-7099", "847-593-6650"], zips: ["60005", "60005", "60070", "60089", "60090"], categories: "Retail")
        
        let lutheranHome = Business(name: "Lutheran Home", locations: ["Arlington Heights"], tiers: ["Tier 2"], tasks: "Delivery, Cleaning, Greeting, Sorting, Recycling", addresses: ["800 W. Oakton St"], phones: ["847-368-7400"], zips: ["60004"], categories: "Care")
        
        let cpk = Business(name: "California Pizza Kitchen", locations: ["Schaumburg", "Arlington Heights"], tiers: ["Tier 1", "Tier 1"], tasks: "Cleaning, Food Service, Customer Service. Sorting, Stocking", addresses: ["1550 E. Golf Rd", "3 S. Evergreen Ave"], phones: ["847-413-9200", "847-590-0801"], zips: ["60173", "60005"], categories: "Restaurant")
        
        let rollingMeadowsLibrary = Business(name: "Rolling Meadows Library", locations: ["Rolling Meadows"], tiers: ["Tier 1"], tasks: "Cleaning, Sorting, Stocking, Delivery", addresses: ["3110 Martin Ln"], phones: ["847-259-6050"], zips: ["6008"], categories:"Recreation")
        
        let willowCreekFoodPantry = Business(name: "Willow Creek Food Pantry", locations: ["South Barrington"], tiers: ["Tier 2"], tasks: "Cleaning, Sorting, Stocking, Packaging", addresses: ["67 E. Algonquin Rd"], phones: ["224-512-2600"], zips: ["60010"], categories: "Food Pantry")
        
        let northwestCompass = Business(name: "Northwest Compass", locations: ["Mount Prospect"], tiers: ["Tier 1"], tasks: "Cleaning, Sorting, Stocking, Packaging", addresses: ["1300 W. Northwest Hwy"], phones: ["847-392-2344"], zips: ["60056"], categories: "Food Pantry")
        
        let fitness19 = Business(name: "Fitness 19", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning", addresses: ["1601 W. Campbell St"], phones: ["847-259-1919"], zips: ["6005"], categories: "Care, Recreation")
        
        let elkGroveBowl = Business(name: "Elk Grove Bowl", locations: ["Elk Grove Village"], tiers: ["Tier 1"], tasks: "Cleaning, Sorting, Facing", addresses: ["53 S. Arlington Heights Rd"], phones: ["847-437-3393"], zips: ["60007"], categories: "Recreation")
        
        let high5PrintWear = Business(name: "High-5 Printwear", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning", addresses: ["3311 N. Ridge Ave"], phones: ["847-818-0081"], zips: ["60004"], categories: "Retail")
        
        let searchInc = Business(name: "Search, Inc", locations: ["Mount Prospect"], tiers: ["Tier 1"], tasks: "Cleaning, Packaging, Building, Sorting", addresses: ["625 Slawin Ct"], phones: ["847-789-7155"], zips: ["60056"], categories: "Factory")
        
        let carniceriasJimenez = Business(name: "Carnicerias Jimenez", locations: ["Wheeling"], tiers: ["Tier 1"], tasks: "Cleaning, Stocking, Facing, Customer Service", addresses: ["550 W. Dundee Rd"], phones: ["847-229-9295"], zips: ["60090"], categories: "Reatail, Grocery")
        
        let ides = Business(name: "IDES", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Sorting", addresses: ["1723 W. Algonquin Rd"], phones: ["800-244-5631"], zips: ["60005"], categories: "Office")
        
        let alexianBrothersMedicalCenter = Business(name: "Alexian Brothers Medical Center", locations: ["Elk Grove Village"], tiers: ["Tier 2"], tasks: "Cleaning, Delivery, Greeting", addresses: ["800 Biesterfield Rd"], phones: ["847-437-5500"], zips: ["60007"], categories: "Care")
        
        let doggiePlayhouse = Business(name: "Doggie Playhouse", locations: ["Palatine"], tiers: ["Tier 1"], tasks: "Cleaning, Greeting, Supervision", addresses: ["1900 N. Rand Rd"], phones: ["847-991-0505"], zips: ["60074"], categories: "Retail, Care")
        
        let familyVideo = Business(name: "Family Video", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Sorting, Facing", addresses: ["2338 E. Rand Rd"], phones: ["847-392-9663"], zips: ["60004"], categories: "Retail, Recreation")
        
        let pokoLokoEarlyLearningCenter = Business(name: "Poko Loko Early Learning Center", locations: ["Wheeling"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Food Service", addresses: ["404 Elmhurst Rd"], phones: ["847-520-4466"], zips: ["60090"], categories: "Care")
        
        let tjMaxx = Business(name: "TJ Maxx", locations: ["Mount Prospect"], tiers: ["Tier 2"], tasks: "Cleaning, Sorting, Stocking, Packaging", addresses: ["1054 Center Dr"], phones: ["847-870-1453"], zips: ["60056"], categories: "Retail")
        
        let marshalls = Business(name: "Marshalls", locations: ["Arlington Heights", "Schaumburg"], tiers: ["Tier 1", "Tier 2"], tasks: "Cleaning, Sorting, Stocking, Packaging", addresses: ["1488 E. Golf Rd", "601 E. Palatine Rd"], phones: ["847-240-0295", "847-577-9177"], zips: ["60173", "60004"], categories: "Retail")
        
        let flowerGardenDayCare = Business(name: "Flower Garden Day Care", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Food Service", addresses: ["2420 E. Rand Rd"], phones: ["847-392-8983"], zips: ["60004"], categories: "Care")
        
        let prospectHeightsParkDistrict = Business(name: "Prospect Heights Park District", locations: ["Prospect Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Greeting", addresses: ["110 W. Camp McDonald Rd"], phones: ["847-394-2848"], zips: ["60070"], categories: "Care, Recreation")
        
        let dakotaKsAutoRepair = Business(name: "Dakota K's Auto Repair", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning", addresses: ["3450 N. Old Arlington Heights Rd"], phones: ["847-348-8106"], zips: ["60004"], categories: "Retail, Factory")
        
        let animalFeedsAndNeeds = Business(name: "Animal Feeds and Needs", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Stocking", addresses: ["401 W. Golf Rd"], phones: ["847-437-4738"], zips: ["60005"], categories: "Care, Retail")
        
        let oldNavy = Business(name: "Old Navy", locations: ["Schaumburg", "Mount Prospect"], tiers: ["Tier 1", "Tier 1"], tasks: "Cleaning, Stocking, Sorting, Packaging", addresses: ["1498 Golf Rd", "1015 N. Elmhurst Rd"], phones: ["847-619-1715", "847-870-0373"], zips: ["60172", "60056"], categories: "Retail")
        
        let bakersBasket = Business(name: "Baker's Basket", locations: ["Elk Grove Village"], tiers: ["Tier 1"], tasks: "Cleaning, Food Service, Stocking, Customer Service", addresses: ["2420 Elmhurst Rd"], phones: ["847-595-3524"], zips: ["60007"], categories: "Retail, Restaurant")
        
        let glamourSalonAndSpa = Business(name: "Glamour Salon and Spa", locations: ["Buffalo Grove"], tiers: ["Tier 1"], tasks: "Cleaning, Stocking, Sorting", addresses: ["60 W. Dundee Rd"], phones: ["847-520-2210"], zips: ["60089"], categories: "Retail")
        
        let elkGroveParkDistrict = Business(name: "Elk Grove Park District", locations: ["Elk Grove Vilage"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Greeting, Food Service", addresses: ["499 Biesterfield Rd"], phones: ["847-437-9494"], zips: ["60007"], categories: "Care, Recreation")
        
        let kindercare = Business(name: "Kindercare", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Greeting, Food Service", addresses: ["1003 S. Arlington Heights Rd"], phones: ["847-593-7510"], zips: ["60005"], categories: "Care")
        
        let arlingtonDogHouse = Business(name: "Arlington Dog House", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Supervision, Stocking, Greeting", addresses: ["213 S. Arlington Heights Rd"], phones: ["847-398-9663"], zips: ["60005"], categories: "Retail, Care")
        
        let oberweisIceCream = Business(name: "Oberweis Ice Cream and Dairy Store", locations: ["Arlington Heights"], tiers: ["Tier 1"], tasks: "Cleaning, Stocking, Food Service", addresses: ["9 W. Dundee Rd"], phones: ["847-368-9060"], zips: ["60004"], categories: "Retail, Restaurant")
        
        let helloAnime = Business(name: "Hello Anime", locations: ["Schaumburg"], tiers: ["Tier 1"], tasks: "Cleaning, Sorting, Stocking, Facing", addresses: ["D212 Woodfield Mall"], phones: ["224-520-8526"], zips: ["60173"], categories: "Retail")
        
        let defaults = [marriott, ikea, walgreens, lutheranHome, cpk, rollingMeadowsLibrary, willowCreekFoodPantry, northwestCompass, fitness19, elkGroveBowl, high5PrintWear, searchInc, carniceriasJimenez, ides, alexianBrothersMedicalCenter, doggiePlayhouse, familyVideo, pokoLokoEarlyLearningCenter, tjMaxx, marshalls, flowerGardenDayCare, prospectHeightsParkDistrict, dakotaKsAutoRepair, animalFeedsAndNeeds, oldNavy, bakersBasket, glamourSalonAndSpa, elkGroveParkDistrict, kindercare, arlingtonDogHouse, oberweisIceCream, helloAnime]
        
        if alreadyExists == nil {
            businesses = defaults
        }
        else {
            for biz in defaults {
                if !(alreadyExists?.contains(biz))! {
                    alreadyExists?.append(biz)
                }
                else {
                    let index = alreadyExists?.index(of: biz)
                    
                    alreadyExists?[index!].name = biz.name
                    alreadyExists?[index!].locations = biz.locations
                    alreadyExists?[index!].tiers = biz.tiers
                    alreadyExists?[index!].tasks = biz.tasks
                    alreadyExists?[index!].addresses = biz.addresses
                    alreadyExists?[index!].phones = biz.phones
                    alreadyExists?[index!].zips = biz.zips
                    alreadyExists?[index!].categories = biz.categories
                }
            }
            
            for exists in alreadyExists! {
                if !(defaults.contains(exists)) {
                    alreadyExists = alreadyExists?.filter {$0 != exists}
                }
            }
            
            businesses = alreadyExists!
        }
        
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
                if business.categories.contains(filter) {
                    filteredBusinesses.append(business)
                }
            case 5:
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
    
    func createAddress(index: Int) -> String {
        let address = self.addresses[index]
        let city = self.locations[index]
        let zip = self.zips[index]
        
        return "\(address), \(city), IL \(zip)"
    }
    
    func createPics() -> [UIImage] {
        var pics:[UIImage] = []
        
        if let pic1 = UIImage(named: "\(self.name) Pic 1") {
            pics.append(pic1)
        }
        else {
            pics.append(#imageLiteral(resourceName: "FalseImage"))
        }
        
        if let pic2 = UIImage(named: "\(self.name) Pic 2") {
            pics.append(pic2)
        }
        else {
            pics.append(#imageLiteral(resourceName: "FalseImage"))
        }
        
        return pics
    }
}

extension Business {
    override func isEqual(_ object: Any?) -> Bool {
        guard let obj = object as? Business else { return false }
        return self.name == obj.name
    }
}
