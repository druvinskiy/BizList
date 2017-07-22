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
    var profileInfo:[String] = ["Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."]
    var sections:[String] = ["Addresses", "Phone Numbers", "Independence Levels", "Tasks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = business?.name
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileCell
        cell.infoLabel.text = profileInfo[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  sections[section]
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    /*func setUI() {
        imageOne.image = business?.createPic1(business: business!)
        imageTwo.image = business?.createPic2(business: business!)
        addressTextView.text = business?.createAddresses(business: business!)
        phoneTextView.text = business?.createPhoneNumbers(business: business!)
        tasksTextView.text = business?.createTasks(business: business!)
        indTextView.text = business?.createTiers(business: business!)
        bizLogo.image = business?.logo
        setFavoriteButton()
    }*/
    
    /*func setFavoriteButton() {
        if !(business?.isFavorite)! {
            favButt.setImage(UIImage(named: "Favorite Button"), for: UIControlState.normal)
            favButt.setImage(UIImage(named: "Favorite Depressed"), for: UIControlState.highlighted)
        }
        else {
            favButt.setImage(UIImage(named: "Unfavorite Button"), for: UIControlState.normal)
            favButt.setImage(UIImage(named: "Unfavorite Depressed"), for: UIControlState.highlighted)
        }
    }*/
 
    @IBAction func onFavoriteButtonTapped(_ sender: UIButton) {
        business?.isFavorite = !(business?.isFavorite)!
        //setFavoriteButton()
        
        let name = Notification.Name(rawValue: favoriteNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
    }
}
