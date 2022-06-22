//
//  SceneDelegate.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit
import SwiftCollections

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
        let ingredients: Ingredients = OrderedDictionary.init(uniqueKeys: ["yeast", "malt",],
                                                              values: ["Wyeast 1272 - American Ale II™",
                                                                       [["name": "Pale Ale",
                                                                         "amount": [2.2: "kilograms"]],
                                                                        ["name": "Caramalt",
                                                                         "amount": [3.0: "kilograms"]]]])
        router.brewList([Brew(name: "a",
                              tagline: "a",
                              imageUrl: nil,
                              abv: 0,
                              ibu: 0,
                              targetFg: 0,
                              targetOg: 0,
                              ebc: 19.5,
                              srm: 9.9,
                              ph: 4.4,
                              attenuationLevel: 75.6,
                              volume: [20: "litres"],
                              boilVolume: [25: "litres"],
                              description: "A description of the brew",
                              ingredients: ingredients)]) // TODO: Remove beer
    }
}

