//
//  BusinessViewController.swift
//  WirelessSupport
//
//  Created by Alan Lam on 2019-04-05.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Small Business Promotions"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        // get rid of the shadow under navigation bar
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }


}

