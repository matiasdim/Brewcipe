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
    
    func brewDetailViewController(for brew: Brew, ingredientsDetailCallback: @escaping (Brew) -> Void) -> UIViewController {
        let vm = BrewDetailViewModel(brew: brew)
        let vc = BrewDetailViewController(viewModel: vm, ingredientsButtonAction: {
            ingredientsDetailCallback(brew)
        })                
        
        return vc
    }
    
    func ingredientsViewController(for ingredients: Ingredients) -> UIViewController {
        let vm = IngredientsViewModel(ingredients: ingredients)
        return IngredientsViewController(viewModel: vm)
    }
    
    
    
}
