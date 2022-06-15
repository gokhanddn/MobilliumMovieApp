//
//  AppRouter.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(with scene: UIWindowScene) {
        let viewController = UIViewController()
        self.window.rootViewController = viewController
        window.makeKeyAndVisible()
        window.windowScene = scene
    }
}
