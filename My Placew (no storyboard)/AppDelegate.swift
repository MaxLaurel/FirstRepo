//
//  AppDelegate.swift
//  My Placew (no storyboard)
//
//  Created by Максим on 10.11.2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("willFinishLaunchingWithOptions")
        IQKeyboardManager.shared.enable = true
        return true
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
       print("configurationForConnecting")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print("didDiscardSceneSessions")
    }
    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
        
    }

}

