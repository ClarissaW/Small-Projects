//
//  ViewController.swift
//  Network Connection Check
//
//  Created by Wang, Zewen on 2018-03-19.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var networkCheckLabel: UILabel!
    let networkReachabilityManager = NetworkReachabilityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if !(networkReachabilityManager?.isReachable)!{
            networkCheckLabel.text = "Internet is not available."
            print("Internet is not available.")
        }else{
            networkCheckLabel.text = "Internet is available."
            print("Internet is available.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

