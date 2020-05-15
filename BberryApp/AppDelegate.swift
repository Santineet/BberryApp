//
//  AppDelegate.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 27.04.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let logoController = LogoController()
        let navViewController = UINavigationController(rootViewController: logoController)
        window?.rootViewController = navViewController
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//           let logoVC = mainStoryboard.instantiateViewController(withIdentifier: "logoVC") as! LogoController
//        window?.rootViewController = logoVC
//        
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

