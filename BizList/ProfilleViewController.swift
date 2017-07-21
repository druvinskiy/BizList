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
        self.title = business?.name
        
        bizLogo.layer.cornerRadius = bizLogo.frame.size.width/2
        bizLogo.clipsToBounds = true
        
        //self.view.backgroundColor = UIColor(red:0.76, green:0.04, blue:0.20, alpha:1.0)
        
        setUI()
    }
    
    func setUI() {
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
        
        let name = Notification.Name(rawValue: favoriteNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
    }
}
