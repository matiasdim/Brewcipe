//
//  NavigationControllerRouter.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import Foundation
import UIKit

class NavigationControllerRouter {
    private(set) var navigationController: UINavigationController
    private(set) var factory: ViewControllerFactory
    
    lazy var brewListSelectionCallback: (Brew) -> Void = { [weak self] in
        self?.selected($0)
    }
    
    lazy var ingredientsDetailCallback: (Brew) -> Void = { [weak self] in
        self?.showRecipeDetail(for: $0)
    }
    
    init(navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        self.factory = factory
    }
    
    func brewList(_ brews: [Brew]) {
        navigationController.pushViewController(factory.brewsViewController(for: brews, selection: brewListSelectionCallback), animated: true)
    }
    
    func selected(_ brew: Brew) {
        navigationController.pushViewController(factory.brewDetailViewController(for: brew, ingredientsDetailCallback: ingredientsDetailCallback), animated: true)
    }
    
    func showRecipeDetail(for brew: Brew) {
        navigationController.present(factory.ingredientsViewController(for: brew.ingredients), animated: true)
    }
}


