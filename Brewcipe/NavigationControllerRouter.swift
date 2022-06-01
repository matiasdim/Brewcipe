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
    private(set) var factory: BrewViewControllerFactory
    
    func selected(_ brew: Brew) {
        navigationController.pushViewController(factory.detailViewController(for: brew), animated: false)
    }
    
    func showRecipeDetail(for brew: Brew) {
        navigationController.present(factory.recipeViewController(for: brew), animated: true)
    }
}

protocol BrewViewControllerFactory {
    func listViewController(for brews: [Brew]) -> UITableViewController
    func detailViewController(for brew: Brew) -> UIViewController
    func recipeViewController(for brew: Brew) -> UIViewController
}

struct Brew {}
