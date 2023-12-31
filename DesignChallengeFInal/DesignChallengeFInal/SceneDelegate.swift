//
//  SceneDelegate.swift
//  DesignChallengeFInal
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let rootNavigationController = UINavigationController(rootViewController: SolutionWithSpacers())
        
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

