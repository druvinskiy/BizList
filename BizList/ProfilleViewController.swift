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
    let clickImg = UIImage(named: "Favorite Button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        bizLogo.image = UIImage(named: bizName)
        bizNameLabel.text = bizName
        addressTextView.text = "Adderess: \(bizAddress) \(bizCity)"
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
    
    @IBAction func onFavoriteButtonTapped(_ sender: UIButton) {
        if !favorites.contains(bizName) {
            favorites.append(bizName)
            self.favButt.setImage(UIImage(named: "Unfavorite Button"), for: UIControlState.normal)
            self.favButt.setImage(UIImage(named: "Unfavorite Depressed"), for: UIControlState.highlighted)

        }
       
        else{
            favorites.remove(at: favorites.index(of: bizName)!)
            self.favButt.setImage(UIImage(named: "Favorite Button"), for: UIControlState.normal)
            self.favButt.setImage(UIImage(named: "Favorite Depressed"), for: UIControlState.highlighted)
        }
           }
    }


    

