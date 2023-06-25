//
//  SceneDelegate.swift
//  DesignChallenge1
//
//  Created by Ramon Ferreira do Nascimento on 25/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let rootNavigationController = UINavigationController(rootViewController: ViewController())
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .offBlack
        rootNavigationController.navigationBar.standardAppearance = apperance
        rootNavigationController.navigationBar.scrollEdgeAppearance = apperance
        
        self.window = window
    }
}

