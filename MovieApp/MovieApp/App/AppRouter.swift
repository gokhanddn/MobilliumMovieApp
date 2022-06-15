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
        let viewController = MovieListBuilder.make() ?? UIViewController()
        let nav = UINavigationController(rootViewController: viewController)
        self.window.rootViewController = nav
        window.makeKeyAndVisible()
        window.windowScene = scene
    }
}
