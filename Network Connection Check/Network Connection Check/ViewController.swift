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
    
    let network = NetworkInstance.sharedInstance
    let url = "https://www.google.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Network is used to check whether there is wifi connection, but cannot make sure that whether it is wifi connected without  internet or with internet.
        network.startNetworkReachabilityObserver()
        
        
        
        //Therefore, using Alamofire.request to check whether google can be used in the device.
        Alamofire.request(url, method: .post).responseData {response in
            if response.result.isSuccess{
                self.networkCheckLabel.text = "Connection Successfully"
            }
            else{
                self.networkCheckLabel.text = "Connection Issue"
            }
        }
    
    }



}

