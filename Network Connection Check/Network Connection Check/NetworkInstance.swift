//
//  NetworkInstance.swift
//  Network Connection Check
//
//  Created by Wang, Zewen on 2018-03-19.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import Foundation
import Alamofire
class NetworkInstance{
    static let sharedInstance = NetworkInstance()
    let networkReachabilityManager = Alamofire.NetworkReachabilityManager (host: "www.google.com")
    func startNetworkReachabilityObserver(){
        
        networkReachabilityManager?.listener = { status in
            switch status {
                case .notReachable:
                     print("Unreachable")
                case .reachable(.ethernetOrWiFi):
                    print("ethernetOrWiFi")
                
                case .reachable(.wwan):
                    print("wwan")
                case .unknown:
                    print("Unknow")
                
            }
        }
        networkReachabilityManager?.startListening()
    }
}

