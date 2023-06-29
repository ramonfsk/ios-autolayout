//
//  SceneDelegate.swift
//  DesignChallenge4
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
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
        
        self.window = window
    }
}

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            let allScenes = UIApplication.shared.connectedScenes
            let scene = allScenes.first { $0.activationState == .foregroundActive }
            guard let windowScene = (scene as? UIWindowScene) else { return false }
            
            return windowScene.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
