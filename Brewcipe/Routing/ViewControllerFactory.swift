//
//  ViewControllerFactory.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit

protocol ViewControllerFactory {
    func brewsViewController(for brews: [Brew]) -> UIViewController
    func brewDetailViewController(for brew: Brew) -> UIViewController
    func recipeViewController(for recipe: String) -> UIViewController
}
