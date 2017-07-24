//
//  ViewController.swift
//  BizList
//  Devin is Great
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

/*var favorites:[String] = []
 var currentArray:[String] = []
 
 var bizNames:[String] = ["Marriott",
 "IKEA",
 "Walgreens",
 "Lutheran Home",
 "California Pizza Kitchen",
 "Rolling Meadows Library",
 "Willow Creek Food Pantry",
 "Northwest Compass",
 "Fitness 19",
 "Elk Grove Bowl",
 "High-5 Printwear",
 "Search, Inc",
 "Jimenez Grocery Store",
 "IDES",
 "Alexian Brothers Medical Center",
 "Doggie Playhouse",
 "Family Video",
 "Poko Loko Early Learning Center",
 "TJ Maxx",
 "Marshalls",
 "Flower Garden Day Care",
 "Prospect Heights Park District",
 "Dakota K's Auto Repair",
 "Animal Feeds and Needs",
 "Old Navy",
 "Baker's Basket",
 "Glamour Salon and Spa",
 "Elk Grove Park District",
 "Kindercare",
 "Arlington Dog House",
 "Oberweis Ice Cream and Dairy Store",
 "Hello Anime"]
 
 var bizLocations:[String] = ["Schaumburg",
 "Schaumburg",
 "Arlington Heights, Arlington Heights, Prospect Heights, Buffalo Grove, Wheeling",
 "Arlington Heights",
 "Schaumburg, Arlington Heights",
 "Rolling Meadows",
 "South Barrington",
 "Mount Prospect",
 "Rolling Meadows",
 "Elk Grove Village",
 "Arlington Heights", "Mount Prospect",
 "Wheeling",
 "Arlington Heights",
 "Elk Grove Village", "Palatine",
 "Arlington Heights",
 "Wheeling",
 "Mount Prospect",
 "Arlington Heights, Schamburg",
 "Arlington Heights",
 "Prospect Heights",
 "Arlington Heights",
 "Arlington Heights",
 "Schaumburg, Mount Prospect",
 "Elk Grove Village",
 "Buffalo Grove",
 "Elk Grove Village",
 "Arlington Heights",
 "Arlington Heights",
 "Arlington Heights",
 "Schaumburg"]
 
 var bizIndLevel:[String] = ["Tier 2",
 "Tier 2",
 "Tier 1",
 "Tier 2",
 "Tier 1",
 "Tier 1",
 "Tier 2",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 2",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 2",
 "Tier 2, Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1",
 "Tier 1"]
 
 var bizTasks:[String] = ["Cleaning, Food Service, Laundry, Recycling",
 "Cleaning, Sorting, Stocking, Food Service, Building, Facing, Recycling",
 "Cleaning, Stocking, Sales",
 "Delivery, Greeting, Sorting, Cleaning, Recycling",
 "Cleaning, Food Service, Sales", "Cleaning, Sorting, Stocking",
 "Cleaning, Sorting, Stocking, Packaging, Delivery",
 "Cleaning, Sorting, Stocking, Packaging",
 "Cleaning",
 "Cleaning, Sorting, Facing",
 "Cleaning",
 "Packaging, Building, Sorting",
 "Cleaning, Stocking, Sales",
 "Sorting",
 "Delivery, Cleaning, Stocking, Recycling, Food Prep",
 "Cleaning, Supervision",
 "Stocking, Cleaning, Sales",
 "Cleaning, Greeting, Supervision",
 "Cleaning, Packaging, Sorting, Stocking, Facing",
 "Cleaning, Packaging, Sorting, Stocking, Facing",
 "Supervision, Cleaning",
 "Greeting, Cleaning, Supervision",
 "Stocking, Sorting, Facing, Cleaning",
 "Supervision, Stocking Sorting, Facing, Cleaning",
 "Stocking, Sorting, Facing, Cleaning, Sales",
 "Food Service, Sorting, Cleaning",
 "Stocking, Sorting, Facing, Cleaning, Sales, Greeting",
 "Cleaning, Greeting",
 "Supervision, Cleaning, Greeting",
 "Supervision, Cleaning",
 "Food Service, Cleaning, Stocking",
 "Cleaning, Stocking, Facing, Packaging"]
 
 var bizAddresses:[String] = ["50 N Martingale Rd.",
 "1800 East McConnor Pkwy",
 "1711 W. Campbell St., 3 E. Golf Rd., 1 N. Elmhurst Rd., 15 N. Buffalo Grove Rd., 1199 W. Dundee Rd.",
 "800 W Oakton St.",
 "1550 E Golf Rd., 3 S. Evergreen Ave.",
 "3 S. Evergreen Ave.",
 "67 E Algonquin Rd.",
 "1300 W Northwest Hwy",
 "1601 W Campbell St.",
 "53 S Arlington Heights Rd.",
 "3311 N Ridge Ave",
 "625 Slawin Ct",
 "550 W Dundee Rd",
 "723 W Algonquin Rd.",
 "800 Biesterfield",
 "1900 N Rand Rd.",
 "740 W Hintz Rd.",
 "404 S Elmhurst Rd.",
 "1054 Center Drive",
 "601 East Palatine Rd, 1488 East Golf Rd",
 "2420 E. Rand Rd.",
 "110 W. Camp McDonald Rd.",
 "3450 Old Arlington Heights Rd.",
 "401 W. Golf Rd.",
 "1498 Golf Rd, 1015 N. Elmhurst Rd.",
 "2420 Elmhurst Rd.",
 "60 W. Dundee Rd.",
 "1000 Wellington Ave",
 "800 S. Arlington Heights Rd.",
 "213 S. Arlington Heights Rd.",
 "9 W Dundee Rd.",
 "D212 Woodfield Mall"]
 
 var bizPhone:[String] = ["847-224-5631",
 "888-888-4532",
 "847-520-7220, 847-398-4673, 847-465-8682, 847-577-7099, 847-593-6650",
 "847-368-7400",
 "847-413-9200, 847-590-0801",
 "847- 259-6050",
 "244-512-2600",
 "U847-392-2344",
 "847-259-1919",
 "847-437-3393",
 "847-818-0081",
 "847-789-7155",
 "847-229-9295",
 "800-244-5631",
 "847-473-5450",
 "847-991-0505",
 "847-215-8500",
 "847-520-4466",
 "847-870-1453",
 "847-240-0295, 847-577-9177",
 "847-392-8983",
 "847-394-2848",
 "847-348-8106",
 "847-437-4738",
 "847-619-1715, 847-870-0373",
 "847-595-3524",
 "847-520-2210",
 "847-437-9494",
 "847-956-7123",
 "847-398-9663",
 "847-368-9060",
 "224-520-8526"]
 
 var bizZips:[String] = ["60173",
 "60173",
 "60005, 60005, 60070, 60089, 60090",
 "60004",
 "60173, 60005",
 "60008",
 "60010",
 "60056",
 "60005",
 "60007",
 "60004",
 "60056",
 "60090",
 "60005",
 "60007",
 "60074",
 "60090",
 "60090",
 "60056",
 "60004, 60173",
 "60004",
 "60070",
 "60004",
 "60005",
 "60172, 60056",
 "60007",
 "60089",
 "60007",
 "60005",
 "60005",
 "60004",
 "60173"]*/

let favoriteNotificationKey = "favoriteKey"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var constraint: NSLayoutConstraint!
    var businesses:[Business] = []
    
    var locations:[String] = ["Mount Prospect", "Rolling Meadows", "Arlington Heights", "Wheeling", "Palatine", "Schaumburg", "Prospect Heights", "Buffalo Grove", "South Barrington", "Elk Grove Village"]
    var tiers:[String] = ["Tier 1", "Tier 2"]
    var tasks:[String] = ["Cleaning", "Sorting", "Stocking", "Facing", "Food Service", "Delivery", "Building", "Laundry", "Greeting", "Sales", "Packaging", "Pricing", "Recycling", "Supervision", "Food Prep"]
    var favorites:[Business] = []
    
    let favorite = Notification.Name(rawValue: favoriteNotificationKey)
    
    func updateFavorites(notification: NSNotification) {
        favorites = Business.getFavorites(businesses: businesses)
        tableView.reloadData()
    }
    
    deinit {
         NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateFavorites(notification:)), name: favorite, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businesses = Business.createBusinessArray()
        //favorites = Business.getFavorites(businesses: businesses)
        alphabetizeFilters()
        createObservers()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func alphabetizeFilters() {
        locations = locations.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        tiers = tiers.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        tasks = tasks.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
    }
    
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = UIColor(red: 0.93333, green: 0.93333, blue: 0.93333, alpha: 1)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainPageCell
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 0.0549, green: 0.25098, blue:  0.5804, alpha: 1)
        }
        else if (indexPath.row % 2 != 0) {
            cell.backgroundColor = UIColor(red:0.00, green:0.47, blue:0.32, alpha:1.0)
        }
        
        cell.label.textColor = UIColor.white
        
        let constantWithImage = CGFloat(12)
        let constantWithoutImage = CGFloat(-130)
        
        let rowHeightWithImage = CGFloat(90)
        let rowHeightWitoutImage = CGFloat(44)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0, 4:
            if segmentedControl.selectedSegmentIndex == 0 {
                cell.label.text = businesses[indexPath.row].name
                cell.logoImageView.image = businesses[indexPath.row].logo
            }
            else {
                cell.label.text = favorites[indexPath.row].name
                cell.logoImageView.image = favorites[indexPath.row].logo
            }
            
            cell.logoImageView.isHidden = false
            cell.constraint.constant = constantWithImage
            tableView.rowHeight = rowHeightWithImage
            
            break
        case 1, 2, 3:
            if segmentedControl.selectedSegmentIndex == 1 {
                cell.label.text = locations[indexPath.row]
            }
            else if segmentedControl.selectedSegmentIndex == 2 {
                cell.label.text = tiers[indexPath.row]
            }
            else {
                cell.label.text = tasks[indexPath.row]
            }
            
            
            cell.logoImageView.isHidden = true
            cell.constraint.constant = constantWithoutImage
            tableView.rowHeight = rowHeightWitoutImage
            
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            returnValue = businesses.count
            break
        case 1:
            returnValue = locations.count
            break
        case 2:
            returnValue = tiers.count
            break
        case 3:
            returnValue = tasks.count
            break
        case 4:
            returnValue = favorites.count
            print(returnValue)
            break
        default:
            break
        }
        
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            performSegue(withIdentifier: "showProfile", sender: businesses[indexPath.row])
            break
        case 1:
            performSegue(withIdentifier: "showFilteredBusinesses", sender: self)
            break
        case 2:
            performSegue(withIdentifier: "showFilteredBusinesses", sender: self)
            break
        case 3:
            performSegue(withIdentifier: "showFilteredBusinesses", sender: self)
            break
        case 4:
            performSegue(withIdentifier: "showProfile", sender: favorites[indexPath.row])
            break
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            //let nav = segue.destination as! UINavigationController
            let profileVC = segue.destination as! ProfilleViewController
            
            profileVC.business = sender as? Business
        }
        else {
            let filteredBusinesVC = segue.destination as! FilteredBusinessesViewController
            let indexPath = tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRow(at: indexPath!) as! MainPageCell
            
            filteredBusinesVC.filteredBusinesses = Business.getFilteredBusinesses(businesses: businesses, index: segmentedControl.selectedSegmentIndex, filter: currentCell.label.text!)
            filteredBusinesVC.filter = currentCell.label.text!
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
