//
//  AppDelegate.swift
//  FoursquareClone
//
//  Created by Hamit  Tırpan on 11.10.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Parse server ile bağlantı kurabilmem için aşağıdaki üç özellik gerekli !
        let configuration = ParseClientConfiguration { (ParseMutableClientConfiguration) in
            ParseMutableClientConfiguration.applicationId = "f0c31matlWE2DLLuFiXn3V3D7hvUKyAHYEPGOtVZ"
            ParseMutableClientConfiguration.clientKey = "doF7SFkPvuw4Uh6YYBx2DMJ6gPTTV2B3J3finozn"
            ParseMutableClientConfiguration.server = "https://parseapi.back4app.com/"
        }
        
        Parse.initialize(with: configuration)
        
        // Kullanıcıyı hatırlama işlemi. Parse'ın current metodunu kullandıktan sonra Storyboard'tan değişken oluşturup onları burada kullanıyorum. Tableview'ımın olduğu ekrana identifier'dan id verip burada ona atama yapabiliyorum.
        let currentUser = PFUser.current()
        if currentUser != nil {
            let board = UIStoryboard(name: "Main", bundle: nil)
            let navigationController = board.instantiateViewController(withIdentifier: "navigationController")
            
            // Artık başlangıç oku bu ekranda olsun diyorum.
            window?.rootViewController = navigationController
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

