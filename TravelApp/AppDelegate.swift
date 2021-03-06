//
//  AppDelegate.swift
//  TravelApp
//
//  Created by 塔肯 on 2021/12/6.
//

import UIKit
import SwiftyFitsize
@main

class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13, *) {
            
        }else {
            
            
            window = UIWindow(frame: UIScreen.main.bounds)
     
            let  tabBar = PLWTabBarViewController()
            
            window?.rootViewController = tabBar
            
            window?.makeKeyAndVisible()
            
        }
          SwiftyFitsize.reference(width: 414)
       
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("--------------\(#function)")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("--------------\(#function)")
    }


}

