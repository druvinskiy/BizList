//
//  FilteredBusinessesViewController.swift
//  BizList
//
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class FilteredBusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var currentArray:[String] = []
    var selection = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = currentArray[indexPath.row]
        
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
        
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profile:ProfilleViewController = segue.destination as! ProfilleViewController
        profile.bizName = selection
        profile.bizAddress = bizAddresses[bizNames.index(of: selection)!]
        profile.bizCity = bizLocations[bizNames.index(of: selection)!]
        profile.bizZip = bizZips[bizNames.index(of: selection)!]
        profile.bizIndLvl = bizIndLevel[bizNames.index(of: selection)!]
        profile.bizTasks = bizTasks[bizNames.index(of: selection)!]
        profile.bizPhone = bizPhone[bizNames.index(of: selection)!]
    }
}
