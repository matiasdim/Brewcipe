//
//  BrewDetailViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

import UIKit

class BrewDetailViewController: UIViewController {
    private(set) var viewModel: BrewDetailViewModel?
    
    convenience init(viewModel: BrewDetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
}
