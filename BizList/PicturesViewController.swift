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
        
        if bussiness?.pic1 != #imageLiteral(resourceName: "FalseImage") {
            pic1.image = bussiness?.pic1
        }
        else {
            pic1.isHidden = true
        }
        
        if bussiness?.pic2 != #imageLiteral(resourceName: "FalseImage") {
            pic2.image = bussiness?.pic2
        }
        else {
            pic2.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
}
