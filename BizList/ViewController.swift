//
//  ViewController.swift
//  BizList
//  Devin is Great
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

let favoriteNotificationKey = "favoriteKey"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var constraint: NSLayoutConstraint!
    var businesses:[Business] = []
    
    var locations:[String] = ["Mount Prospect", "Rolling Meadows", "Arlington Heights", "Wheeling", "Palatine", "Schaumburg", "Prospect Heights", "Buffalo Grove", "South Barrington", "Elk Grove Village"]
    var tiers:[String] = ["Tier 1", "Tier 2"]
    var tasks:[String] = ["Cleaning", "Sorting", "Stocking", "Facing", "Food Service", "Delivery", "Building", "Laundry", "Greeting", "Customer Service", "Packaging", "Pricing", "Recycling", "Supervision"]
    var categories:[String] = ["Hotel", "Retail", "Care", "Restaurant", "Recreation", "Factory", "Office"]
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
        
        if let data = UserDefaults.standard.object(forKey: "bussiness") as? NSData {
            let bussinessArray = NSKeyedUnarchiver.unarchiveObject(with: data as Data)
            let alreadyExists = bussinessArray as! [Business]
            businesses = Business.createBusinessArray(alreadyExists: alreadyExists)
            favorites = Business.getFavorites(businesses: businesses)
            
            let data = NSKeyedArchiver.archivedData(withRootObject: businesses)
            UserDefaults.standard.set(data, forKey: "bussiness")
        }
        else {
            businesses = Business.createBusinessArray()
            
            let data = NSKeyedArchiver.archivedData(withRootObject: businesses)
            UserDefaults.standard.set(data, forKey: "bussiness")
        }
        
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
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red:0.73, green:0.87, blue:0.98, alpha:1.0)
            cell.label.textColor = UIColor(red:0.08, green:0.40, blue:0.75, alpha:1.0)
        }
        else if (indexPath.row % 2 != 0) {
            cell.backgroundColor = UIColor(red:0.86, green:0.93, blue:0.78, alpha:1.0)
            cell.label.textColor = UIColor(red:0.33, green:0.55, blue:0.18, alpha:1.0)
        }
        
        let constantWithImage = CGFloat(12)
        let constantWithoutImage = CGFloat(-130)
        
        let rowHeightWithImage = CGFloat(90)
        let rowHeightWitoutImage = CGFloat(44)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0, 5:
            if segmentedControl.selectedSegmentIndex == 0 {
                cell.label.text = businesses[indexPath.row].name
                cell.logoImageView.image = UIImage(named: "\(businesses[indexPath.row].name)")
            }
            else {
                cell.label.text = favorites[indexPath.row].name
                cell.logoImageView.image = UIImage(named: "\(favorites[indexPath.row].name)")
            }
            
            cell.logoImageView.isHidden = false
            cell.constraint.constant = constantWithImage
            tableView.rowHeight = rowHeightWithImage
            
            break
        case 1, 2, 3, 4:
            if segmentedControl.selectedSegmentIndex == 1 {
                cell.label.text = locations[indexPath.row]
            }
            else if segmentedControl.selectedSegmentIndex == 2 {
                if tiers[indexPath.row] == "Tier 1" {
                    cell.label.text = "Tier 1 - Independent"
                }
                else {
                    cell.label.text = "Tier 2 - Job Coach"
                }
            }
            else if segmentedControl.selectedSegmentIndex == 3 {
                cell.label.text = tasks[indexPath.row]
            }
            else {
                cell.label.text = categories[indexPath.row]
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
            returnValue = categories.count
            break
        case 5:
            returnValue = favorites.count
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
            performSegue(withIdentifier: "showFilteredBusinesses", sender: self)
        case 5:
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
            
            var filter = currentCell.label.text!
            
            if filter == "Tier 1 - Independent" {
                filter = "Tier 1"
            }
            else if filter == "Tier 2 - Job Coach" {
                filter = "Tier 2"
            }
            
            filteredBusinesVC.filteredBusinesses = Business.getFilteredBusinesses(businesses: businesses, index: segmentedControl.selectedSegmentIndex, filter: filter)
            filteredBusinesVC.filter = currentCell.label.text!
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
