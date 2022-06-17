//
//  BrewDetailViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

import UIKit

class BrewDetailViewController: UIViewController {
    private(set) var viewModel: BrewDetailViewModel?
    
    @IBOutlet private(set) weak var abvLabel: UILabel!
    @IBOutlet private(set) weak var ibuLabel: UILabel!
    @IBOutlet private(set) weak var targetFgLabel: UILabel!
    @IBOutlet private(set) weak var targetOgLabel: UILabel!
    @IBOutlet private(set) weak var ebcLabel: UILabel!
    @IBOutlet private(set) weak var srmLabel: UILabel!
    @IBOutlet private(set) weak var phLabel: UILabel!
    @IBOutlet private(set) weak var attenuationLevelLabel: UILabel!
    @IBOutlet private(set) weak var volumeLabel: UILabel!
    @IBOutlet private(set) weak var boilVolumeLabel: UILabel!
    
    convenience init(viewModel: BrewDetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = viewModel?.title
    }
}
