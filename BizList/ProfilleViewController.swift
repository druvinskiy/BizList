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
    
    var business: Business?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func saveFavorites() {
        let notificationNme = NSNotification.Name("NotificationIdf")
        NotificationCenter.default.post(name: notificationNme, object: nil)
        
        let defaults = UserDefaults.standard
        //let token = favorites
        
        //defaults.set(token, forKey: "MyKey")
        defaults.synchronize()
    }
    
    func setUI() {
        bizNameLabel.text = business?.name
        imageOne.image = business?.createPic1(business: business!)
        imageTwo.image = business?.createPic2(business: business!)
        addressTextView.text = business?.createAddresses(business: business!)
        phoneTextView.text = business?.createPhoneNumbers(business: business!)
        tasksTextView.text = business?.createTasks(business: business!)
        indTextView.text = business?.createTiers(business: business!)
        bizLogo.image = business?.logo
        setFavoriteButton()
    }
    
    func setFavoriteButton() {
        if !(business?.isFavorite)! {
            favButt.setImage(UIImage(named: "Favorite Button"), for: UIControlState.normal)
            favButt.setImage(UIImage(named: "Favorite Depressed"), for: UIControlState.highlighted)
        }
        else {
            favButt.setImage(UIImage(named: "Unfavorite Button"), for: UIControlState.normal)
            favButt.setImage(UIImage(named: "Unfavorite Depressed"), for: UIControlState.highlighted)
        }
    }
 
    @IBAction func onFavoriteButtonTapped(_ sender: UIButton) {
        business?.isFavorite = !(business?.isFavorite)!
        setFavoriteButton()
        saveFavorites()
    }
}
