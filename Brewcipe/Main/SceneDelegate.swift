//
//  SceneDelegate.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var navigationController = UINavigationController()
    private lazy var factory = BrewViewControllerFactory()
    private lazy var router = NavigationControllerRouter(navigationController: navigationController, factory: factory)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene  = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        start()
    }
    
    private func start() {
        router.brewList([Brew(name: "a", tagline: "a", imageUrl: nil, abv: 0, ibu: 0, targetFg: 0, targetOg: 0)]) // TODO: Remove beer
    }
}

