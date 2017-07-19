//
//  ProfilleViewController.swift
//  BizList
//
//  Created by David Ruvinskiy on 6/28/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class ProfilleViewController: UIViewController {

    @IBOutlet weak var bizLogo: UIImageView!
    @IBOutlet weak var bizNameLabel: UILabel!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var indTextView: UITextView!
    @IBOutlet weak var tasksTextView: UITextView!
    @IBOutlet weak var phoneTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var favButt: UIButton!
    
    var bizName = ""
    var bizAddress = ""
    var bizIndLvl = ""
    var bizTasks = ""
    var bizCity = ""
    var bizZip = ""
    var bizPhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bizLogo.image = UIImage(named: bizName)
        bizNameLabel.text = bizName
        
        createAddresses()
        createPhoneNumber()
        createTier()
        
        tasksTextView.text = "Tasks: \(bizTasks)"
        
        if (UIImage(named: "\(bizName) Pic 1") != nil) {
            imageOne.image = UIImage(named: "\(bizName) Pic 1")
        }
        else {
            imageOne.image = UIImage(named: "FalseImage")
        }
        
        if (UIImage(named: "\(bizName) Pic 2") != nil) {
            imageTwo.image = UIImage(named: "\(bizName) Pic 2")
        }
        else {
            imageTwo.image = UIImage(named: "FalseImage")
        }
        
        if !favorites.contains(bizName){
            favButt.setImage(UIImage(named: "Favorite Button"), for: UIControlState.normal)
            favButt.setImage(UIImage(named: "Favorite Depressed"), for: UIControlState.highlighted)
        }
        
        if  favorites.contains(bizName){
            favButt.setImage(UIImage(named: "Unfavorite Button"), for: UIControlState.normal)
            favButt.setImage(UIImage(named: "Unfavorite Depressed"), for: UIControlState.highlighted)
        }
    }
    
    func createAddresses() {
        let addresses = bizAddress.components(separatedBy: ", ")
        let zips = bizZip.components(separatedBy: ", ")
        let cities = bizCity.components(separatedBy: ", ")
        bizAddress = addressTextView.text
        
        for address in addresses {
            let index = addresses.index(of: address)
            
            let city = cities[index!]
            let zip = zips[index!]
            
            bizAddress = "\(bizAddress)\n\n\(address), \(city), IL \(zip)"
        }
        
        addressTextView.text = bizAddress
    }
    
    func createPhoneNumber() {
        let phoneNumber = bizPhone.components(separatedBy: ", ")
        bizPhone = phoneTextView.text
        
        for phone in phoneNumber {
            bizPhone = "\(bizPhone)\n\n\(phone)"
        }
        
        phoneTextView.text = bizPhone
    }
    
    func createTier() {
        let tiers = bizIndLvl.components(separatedBy: ", ")
        bizIndLvl = indTextView.text
        
        for tier in tiers {
            bizIndLvl = "\(bizIndLvl)\n\n\(tier)";
        }
        
        indTextView.text = bizIndLvl
    }
    
    func saveFavorites() {
        let notificationNme = NSNotification.Name("NotificationIdf")
        NotificationCenter.default.post(name: notificationNme, object: nil)
        
        let defaults = UserDefaults.standard
        let token = favorites
        
        defaults.set(token, forKey: "MyKey")
        defaults.synchronize()
    }
 
    @IBAction func onFavoriteButtonTapped(_ sender: UIButton) {
        if !favorites.contains(bizName) {
            
            favorites.append(bizName)
            
            self.favButt.setImage(UIImage(named: "Unfavorite Button"), for: UIControlState.normal)
            self.favButt.setImage(UIImage(named: "Unfavorite Depressed"), for: UIControlState.highlighted)
            
            saveFavorites()
        }
        else {
            let index = favorites.index(of: bizName)
            
            favorites.remove(at: index!)
            
            self.favButt.setImage(UIImage(named: "Favorite Button"), for: UIControlState.normal)
            self.favButt.setImage(UIImage(named: "Favorite Depressed"), for: UIControlState.highlighted)
            
            saveFavorites()
        }
    }
}
