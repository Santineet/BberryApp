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
        customizeNavigationBar()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }

    
    func customizeNavigationBar(){
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1294117647, green: 0.2431372549, blue: 0.3725490196, alpha: 1)
        UINavigationBar.appearance().alpha = 1.0
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage
            = UIImage(named: "ic_back")
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "ic_back")
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

