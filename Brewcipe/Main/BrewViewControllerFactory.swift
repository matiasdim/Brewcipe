//
//  BrewViewControllerFactory.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 5/06/22.
//

import UIKit

class BrewViewControllerFactory: ViewControllerFactory {
    func brewsViewController(for brews: [Brew], selection: @escaping (Brew) -> Void) -> UIViewController {
        let vm = BrewListViewModel(brews: brews)
        let vc = BrewListViewController(viewModel: vm, selection: { index in
            if index < brews.count {
                selection(brews[index])
            }
        })
        
        return vc
    }
    
    func brewDetailViewController(for brew: Brew) -> UIViewController {
        let vm = BrewDetailViewModel()
        return BrewDetailViewController(viewModel: vm)
    }
    
    func recipeViewController(for recipe: String) -> UIViewController {
        return RecipeViewController(recipe: recipe)
    }
    
    
    
}
