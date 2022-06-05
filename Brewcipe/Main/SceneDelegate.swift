//
//  SceneDelegate.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        let factory: ViewControllerFactory! // TODO: Add factory class
        guard let windowScene  = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        // TODO: BrewListViewController is given by a factory method
        let brewList = BrewListViewController(
            viewModel:
                BrewListViewModel(
                    brews: [
                        Brew(name: "Brew",
                             tagline: "tagline",
                             imageUrl: "https://images.punkapi.com/v2/keg.png",
                             abv: 10.27,
                             ibu: 50,
                             targetFg: 1010,
                             targetOg: 1040)
                    ]
                )
        )        
        window?.rootViewController = UINavigationController(rootViewController: brewList)
        window?.makeKeyAndVisible()
    }
}

