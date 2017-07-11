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
    
    var bizName = "";
    var bizAddress = "";
    var indLvl = "";
    var tasks = "";
    //Change
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        bizLogo.image = UIImage(named: bizName)
        bizNameLabel.text = bizName
        addressTextView.text = "Adderess: \(bizAddress)"
        indTextView.text = "Independence Level: \(indLvl)"
        tasksTextView.text = "Tasks: \(tasks)"
    }
    
    
    @IBAction func onFavoriteButtonTapped(_ sender: UIButton) {
        if !favorites.contains(bizName) {
            favorites.append(bizName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
