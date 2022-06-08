//
//  NavigationControllerRouter.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import Foundation
import UIKit

struct NavigationControllerRouter {
    private(set) var navigationController: UINavigationController
    private(set) var factory: ViewControllerFactory
    
    func brewList(_ brews: [Brew]) {
        navigationController.pushViewController(factory.brewsViewController(for: brews) { brew in
            selected(brew)
        }, animated: true)
    }
    
    func selected(_ brew: Brew) {
        navigationController.pushViewController(factory.brewDetailViewController(for: brew), animated: true)
    }
    
    func showRecipeDetail(for brew: Brew) {
        navigationController.present(factory.recipeViewController(for: "recipe description"), animated: true)
    }
}


