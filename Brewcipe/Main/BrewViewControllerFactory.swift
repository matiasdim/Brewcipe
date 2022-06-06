//
//  BrewViewControllerFactory.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 5/06/22.
//

import UIKit

struct BrewViewControllerFactory: ViewControllerFactory {
    func brewsViewController(for brews: [Brew]) -> UIViewController {
        let vm = BrewListViewModel(brews: brews)
        return BrewListViewController(viewModel: vm)
    }
    
    func brewDetailViewController(for brew: Brew) -> UIViewController {
        let vm = BrewDetailViewModel()
        return BrewDetailViewController(viewModel: vm)
    }
    
    func recipeViewController(for recipe: String) -> UIViewController {
        return RecipeViewController(recipe: recipe)
    }
}
