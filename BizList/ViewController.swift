 //
//  ViewController.swift
//  BizList
//
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit
 
var favorites:[String] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var bizNames:[String] = ["Marriott", "IKEA", "Walgreens", "Lutheran Home", "California Pizza Kitchen", "Rolling Meadows Library", "Willow Creek Food Pantry", "Northwest Compass", "Fitness 19" ,"Elk Grove Bowling Alley", "High-5 Printwear", "Search, Inc", "Jimenez Grocery Store", "IDES", "Alexian Brothers Medical Center", "Doggie Playhouse", "Family Video", "Poko Loko Early Learning Center", "TJ Maxx", "Marshalls", "Day's Inn"]
    
    var bizLocations:[String] = ["Schaumburg", "Schaumburg", "Arlington Heights, Rolling Meadows", "Arlington Heights", "Schaumburg", "Rolling Meadows", "South Barrington", "Mount Prospect", "Rolling Meadows", "Elk Grove Village", "Arlington Heights", "Mount Prospect", "Wheeling", "Arlington Heights", "Elk Grove Village", "Palatine", "Arlington Heights", "Wheeling", "Mount Prospect", "Arlington Heights", "Arlington Heights"]
    
    var bizIndLevel:[String] = ["Tier 2", "Tier 2", "Tier 1", "Tier 2", "Tier 1", "Tier 1", "Tier 2", "Tier 1", "Tier 1", "Tier 1","Tier 1", "Tier 1", "Tier 1", "Tier 1", "Tier 1", "Tier 1", "Tier 1", "Tier 1", "Tier 2", "Tier 2", "Tier 2"]
    
    var bizTasks:[String] = ["Cleaning, Food Service, Laundry, Recycling", "Cleaning, Sorting, Stocking, Food Service, Building, Facing, Recycling", "Cleaning, Stocking, Sales", "Delivery, Greeting, Sorting, Cleaning, Recycling", "Cleaning, Food Service, Sales", "Cleaning, Sorting, Stocking", "Cleaning, Sorting, Stocking, Packaging, Delivery", "Cleaning, Sorting, Stocking, Packaging", "Cleaning", "Cleaning, Sorting, Facing", "Cleaning", "Packaging, Building, Sorting", "Cleaning, Stocking, Sales", "Sorting", "Delivery, Cleaning, Stocking, Recycling, Food Prep", "Cleaning, Supervision", "Stocking, Cleaning, Sales", "Cleaning, Greeting, Supervision", "Cleaning, Packaging, Sorting, Stocking, Facing", "Cleaning, Packaging, Sorting, Stocking, Facing", "Laundry, Cleaning, Stocking"]
    
    var bizAddresses:[String] = ["50 N Martingale Rd.","Unavailable","Unavailable","800 W Oakton St.","1550 E Golf Rd.","3110 Martin Ln.","67 E Algonquin Rd.","Unavailable","1601 W Campbell St.","53 S Arlington Heights Rd.","THIS BUISNESS DOES NOT EXIST","Unavailable","Unavailable","723 W Algonquin Rd.","800 Biesterfield","1900 N Rand Rd.","740 W Hintz Rd.","404 S Elmhurst Rd.","Unavailable","Unavailable","Unavailable"]
    
    var locations:[String] = ["Mount Prospect", "Rolling Meadows", "Arlington Heights", "Wheeling", "Elk Grove", "Des Plaines", "Palatine", "Schaumburg"]
    
    var indLevel:[String] = ["Tier 1", "Tier 2"]
    
    var tasks:[String] = ["Cleaning", "Sorting", "Stocking", "Facing", "Food Service", "Delivery", "Building", "Laundry", "Greeting", "Sales", "Packaging", "Pricing", "Recycling", "Supervision", "Food Prep"]
    
    var bizPhone:[String] = ["847-224-5631","Unavailable","Unavailable","847-368-74000","847-413-9200","847- 259-6050","244-512-2600","Unavialable","847-259-1919","847-437-3393","Unavailable","Unavailable","Unavailable","800-244-5631","847-473-5450","847-991-0505","847-215-8500","847-520-4466","Unavailabe","Unavailable","Unavialable"]
    
    var selection = ""
    var currentArray:[String] = []
    var mainArray:[String] = []
    var arrayName = ""
    var sendArray:[String] = []
    var goingToProfile = true
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        let index:Int = sender.selectedSegmentIndex
        
        if index == 0 {
            currentArray = bizNames
            mainArray = bizNames
            goingToProfile = true;
        }
        else if index == 1 {
            currentArray = locations
            mainArray = bizLocations
            goingToProfile = false;
        }
        else if index == 2 {
            currentArray = indLevel
            mainArray = bizIndLevel
            goingToProfile = false;
        }
        else if index == 3 {
            currentArray = tasks
            mainArray = bizTasks
            goingToProfile = false;
        }
        else {
            currentArray = favorites
            mainArray = favorites
            goingToProfile = true
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentArray = bizNames
        mainArray = bizNames
        goingToProfile = true;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = UIColor(red: 0.93333, green: 0.93333, blue: 0.93333, alpha: 1)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var alphabetized = currentArray.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        cell.textLabel!.text = alphabetized[indexPath.row]
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 0.0549, green: 0.25098, blue:  0.5804, alpha: 1)
            cell.textLabel?.textColor = UIColor.white
        }
        else if (indexPath.row % 2 != 0) {
            cell.backgroundColor = UIColor(red:0.00, green:0.47, blue:0.32, alpha:1.0)
            cell.textLabel?.textColor = UIColor.white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        selection = (cell.textLabel?.text)!
        sendArray.removeAll()
        
        if (mainArray == bizNames || mainArray == favorites) {
            performSegue(withIdentifier: "showProfile", sender: self)
        }
        else {
            for i in 0 ..< mainArray.count {
                if mainArray[i].range(of:selection) != nil {
                    sendArray.append(bizNames[i])
                }
            }
            
            performSegue(withIdentifier: "showFilteredBusinesses", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (!goingToProfile) {
            let filteredBusinesses:FilteredBusinessesViewController = segue.destination as! FilteredBusinessesViewController
            filteredBusinesses.currentArray = sendArray
        }
        else {
            let profile:ProfilleViewController = segue.destination as! ProfilleViewController
            profile.bizName = selection
            profile.bizAddress = bizAddresses[bizNames.index(of: selection)!]
            print(profile.bizAddress)
            profile.indLvl = bizIndLevel[bizNames.index(of: selection)!]
            profile.tasks = bizTasks[bizNames.index(of: selection)!]
        }
    }
}

