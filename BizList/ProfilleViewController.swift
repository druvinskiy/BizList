//
//  ProfilleViewController.swift
//  BizList
//
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class ProfilleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var business: Business?
    
    let sectionTitles: [String] = ["Locations", "Tasks", "Categories"]
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = business?.name
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        createActionSheet()
    }
    
    func createActionSheet() {
        alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(createFavoriteAction())
        
        let pics = business?.createPics()
        
        if pics![0] != #imageLiteral(resourceName: "FalseImage") || pics?[1] != #imageLiteral(resourceName: "FalseImage") {
            alertController.addAction(createPhotosAction())
        }
    }
    
    func createFavoriteAction() -> UIAlertAction {
        var favoriteTitle = ""
        var favoriteStyle = UIAlertActionStyle.destructive
        
        if (!(self.business?.isFavorite)!) {
            favoriteTitle = "Add to Favorites"
            favoriteStyle = .default
        }
        else {
            favoriteTitle = "Remove from Favorites"
            favoriteStyle = .destructive
        }
        
        let favoriteAction = UIAlertAction(title: favoriteTitle, style: favoriteStyle) { (action) in
            self.business?.isFavorite = !(self.business?.isFavorite)!
            
            let name = Notification.Name(rawValue: favoriteNotificationKey)
            NotificationCenter.default.post(name: name, object: nil)
            
            if let data = UserDefaults.standard.object(forKey: "bussiness") as? NSData {
                let bussinessArray = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! [Business]
                
                let index = bussinessArray.index(of: self.business!)
                bussinessArray[index!].isFavorite = (self.business?.isFavorite)!
                
                let data = NSKeyedArchiver.archivedData(withRootObject: bussinessArray)
                UserDefaults.standard.set(data, forKey: "bussiness")
            }
            
            self.createActionSheet()
        }
        
        return favoriteAction
    }
    
    func createPhotosAction() -> UIAlertAction {
        let photosAction = UIAlertAction(title: "View Photos", style: .default) { (action) in
            self.performSegue(withIdentifier: "showPictures", sender: self)
        }
        
        return photosAction
    }
    
    @IBAction func optionsButtonPressed(_ sender: UIBarButtonItem) {
        alertController.popoverPresentationController?.barButtonItem = sender
        self.present(alertController, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "cell") as! ProfileCell
        
        if indexPath.section == 0 {
            cell.addressInfoLabel.text = business?.createAddress(index: indexPath.row)
            cell.phoneInfoLabel.text = business?.phones[indexPath.row]
            cell.tierInfoLabel.text = business?.tiers[indexPath.row]
            
            if (indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
            }
            else if (indexPath.row % 2 != 0) {
                cell.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:1.0)
            }
        }
        else {
            cell.constraint.constant = -87
            tableView.rowHeight = 44
            
            cell.phoneInfoLabel.isHidden = true
            cell.tierInfoLabel.isHidden = true
            
            cell.addressLabel.isHidden = true
            cell.phoneLabel.isHidden = true
            cell.tierLabel.isHidden = true
            
            if indexPath.section == 1 {
                cell.addressInfoLabel.text = business?.tasks
            }
            else {
                cell.addressInfoLabel.text = business?.categories
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (business?.locations.count)!
        }
        else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.0)
        
        let label = UILabel()
        label.text = sectionTitles[section]
        label.font = UIFont(name: "Quattrocento", size: 20)
        label.textColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        label.frame = CGRect(x: 12, y: 0, width: 100, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let picturesVC = segue.destination as! PicturesViewController
        picturesVC.bussiness = business
    }
}
