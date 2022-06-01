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
    private(set) var viewControllerFactory: ViewControllerFactory
    
//    func showRecipe(for brew: Brew) {
//        navigationController.pushViewController(UIViewController(), animated: true)
//    }
}

protocol ViewControllerFactory {
    func listViewController(for brews: [Brew]) -> UITableViewController
    func detailViewController(for brew: Brew) -> UIViewController
}
struct Brew {}
