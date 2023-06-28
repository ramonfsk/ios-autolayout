//
//  SceneDelegate.swift
//  DesignChallenge3
//
//  Created by Ramon Ferreira do Nascimento on 28/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let rootNavigationController = CustomNavigationController(rootViewController: Challenge())
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .offBlack
        rootNavigationController.navigationBar.standardAppearance = apperance
        rootNavigationController.navigationBar.scrollEdgeAppearance = apperance
        
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

final class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
