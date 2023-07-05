//
//  UIWindow+Extension.swift
//  DesignChallengeFInal
//
//  Created by Ramon Ferreira do Nascimento on 30/06/23.
//

import UIKit

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
