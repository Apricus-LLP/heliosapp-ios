//
//  SceneDelegate.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = AppStoryboard.main.getRootViewController(TabBarController.self)
        
        let storyboard = UIStoryboard(name: "Login", bundle: .main)
        let loginVc = storyboard.instantiateViewController(withIdentifier: "TermsAndServicesVc")
        //let loginVc = AppStoryboard.login.getRootViewController(TermsAndServicesVс.self)
        
        window.rootViewController = loginVc
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        //
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        //
    }

    func sceneWillResignActive(_ scene: UIScene) {
        //
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        //
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        //
    }
}

