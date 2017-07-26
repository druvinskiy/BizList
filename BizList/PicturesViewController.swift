//
//  PicturesViewController.swift
//  BizList
//
//  Created by David Ruvinskiy on 7/23/17.
//  Copyright © 2017 David Ruvinskiy. All rights reserved.
//

import UIKit

class PicturesViewController: ViewController {
    
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    var bussiness:Business?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(bussiness!.name) Pictures"
        
        let pics = bussiness?.createPics()
        
        if pics?[0] != #imageLiteral(resourceName: "FalseImage") {
            pic1.image = pics?[0]
        }
        else {
            pic1.isHidden = true
        }
        
        if pics?[1] != #imageLiteral(resourceName: "FalseImage") {
            pic2.image = pics?[1]
        }
        else {
            pic2.isHidden = true
        }
        
        view.backgroundColor = UIColor(red:0.88, green:0.88, blue:0.88, alpha:1.0)
        
        // Do any additional setup after loading the view.
    }
}
