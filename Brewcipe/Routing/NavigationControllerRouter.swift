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
    
    func selected(_ brew: Brew) {
        navigationController.pushViewController(factory.detailViewController(for: brew), animated: false)
    }
    
    func showRecipeDetail(for brew: Brew) {
        navigationController.present(factory.recipeViewController(for: brew), animated: true)
    }
}


