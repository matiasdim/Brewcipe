//
//  ViewControllerFactory.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit

protocol ViewControllerFactory {
    func listViewController(for brews: [Brew]) -> UIViewController
    func detailViewController(for brew: Brew) -> UIViewController
    func recipeViewController(for brew: Brew) -> UIViewController
}
