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
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var favButt: UIButton!
    
    var bizName = ""
    var bizAddress = ""
    var indLvl = ""
    var tasks = ""
    var bizCity = ""
    var bizZips = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        createAddresses()
        bizLogo.image = UIImage(named: bizName)
        bizNameLabel.text = bizName
        //addressTextView.text = "Address: \(bizAddress), \(bizCity) \(bizZips)"
        indTextView.text = "Independence Level: \(indLvl)"
        tasksTextView.text = "Tasks: \(tasks)"
        
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
        bizAddress = addressTextView.text
        
        let zips = bizZips.components(separatedBy: ", ")
        
        let cities = bizCity.components(separatedBy: ", ")
        
        for address in addresses {
            bizAddress = "\(bizAddress)\n\n\(address), \(cities[addresses.index(of: address)!]), IL \(zips[addresses.index(of: address)!])\n"
        }
        
        
        
        addressTextView.text = bizAddress
    }
 
    
    @IBAction func onFavoriteButtonTapped(_ sender: UIButton) {
        if !favorites.contains(bizName) {
            favorites.append(bizName)
            self.favButt.setImage(UIImage(named: "Unfavorite Button"), for: UIControlState.normal)
            self.favButt.setImage(UIImage(named: "Unfavorite Depressed"), for: UIControlState.highlighted)

        }
        else {
            favorites.remove(at: favorites.index(of: bizName)!)
            self.favButt.setImage(UIImage(named: "Favorite Button"), for: UIControlState.normal)
            self.favButt.setImage(UIImage(named: "Favorite Depressed"), for: UIControlState.highlighted)
        }
    }
}
