//
//  ViewControllerFactory.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit

protocol ViewControllerFactory {
    func brewsViewController(for brews: [Brew], selection: @escaping (Brew) -> Void) -> UIViewController
    func brewDetailViewController(for brew: Brew) -> UIViewController
    func ingredientsViewController(for recipe: String) -> UIViewController
}
