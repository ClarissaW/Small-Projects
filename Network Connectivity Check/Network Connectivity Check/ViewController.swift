//
//  ViewController.swift
//  Network Connectivity Check
//
//  Created by Wang, Zewen on 2018-03-19.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit
import SystemConfiguration
class ViewController: UIViewController {
    var reachability:SCNetworkReachability?
    var reachabilityFlag:SCNetworkConnectionFlags?
    
    @IBOutlet weak var connectionCheckLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

