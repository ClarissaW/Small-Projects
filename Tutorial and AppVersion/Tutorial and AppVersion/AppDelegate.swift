//
//  AppDelegate.swift
//  Tutorial and AppVersion
//
//  Created by Wang, Zewen on 2018-02-28.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Get current app Version
        let userDefaults = UserDefaults.standard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let isFirstStart = userDefaults.value(forKey: "isFirstLaunch") as? Bool {
            print("This is not the first launch")
            
            let vc : ViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController? = vc
        } else {
            print("this is the first launch")
            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
            let vc : TutorialViewController = mainStoryboard.instantiateViewController(withIdentifier: "TutorialViewController") as! TutorialViewController
            
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = vc
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

