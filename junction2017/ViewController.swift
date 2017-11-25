//
//  ViewController.swift
//  junction2017
//
//  Created by Ostrenkiy on 25.11.2017.
//  Copyright © 2017 Ostrenkiy. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebooklogin(_ sender: Any) {
        FBSocialSDKProvider.instance.getAccessInfo().then {
            (arg) -> Void in
            
            let (token, email) = arg
        }
    }
    
}

