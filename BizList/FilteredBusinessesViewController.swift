//
//  FilteredBusinessesViewController.swift
//  BizList
//
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class FilteredBusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var filteredBusinesses:[Business] = []
    var filter = ""
    
    let favorite = Notification.Name(rawValue: favoriteNotificationKey)
    
    func updateFavorites(notification: NSNotification) {
        filteredBusinesses = Business.getFavorites(businesses: filteredBusinesses)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(FilteredBusinessesViewController.updateFavorites(notification:)), name: favorite, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        self.title = filter
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FilterCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red:0.73, green:0.87, blue:0.98, alpha:1.0)
            cell.label.textColor = UIColor(red:0.08, green:0.40, blue:0.75, alpha:1.0)
        }
        else if (indexPath.row % 2 != 0) {
            cell.backgroundColor = UIColor(red:0.86, green:0.93, blue:0.78, alpha:1.0)
            cell.label.textColor = UIColor(red:0.33, green:0.55, blue:0.18, alpha:1.0)
        }
        
        cell.label.text = filteredBusinesses[indexPath.row].name
        cell.logoImageView.image = UIImage(named: "\(filteredBusinesses[indexPath.row].name)")
        
        let constantWithImage = CGFloat(12)
        let rowHeightWithImage = CGFloat(90)
        
        cell.constraint.constant = constantWithImage
        tableView.rowHeight = rowHeightWithImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBusinesses.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProfile", sender: filteredBusinesses[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as! ProfilleViewController
        profileVC.business = sender as? Business
    }
}
