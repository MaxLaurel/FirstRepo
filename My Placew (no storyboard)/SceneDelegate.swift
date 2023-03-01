//
//  SceneDelegate.swift
//  My Placew (no storyboard)
//
//  Created by Максим on 10.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let ViewController = HomeViewController()
        let NavController = UINavigationController(rootViewController: ViewController)
        window.rootViewController = NavController
        self.window = window
        window.makeKeyAndVisible()
        print("willConnectTooptions")
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
   print("sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       print("sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground")
    }


}

