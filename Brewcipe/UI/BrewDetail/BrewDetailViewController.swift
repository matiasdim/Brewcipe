//
//  BrewDetailViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

/// TODO: Missing
#warning("Missing to add labels for each value, description label and button ingredients action. Also confifure image")

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
    @IBOutlet private(set) weak var ingredientsButton: UIButton!
    
    private(set) var ingredientsButtonAction: (() -> Void)?
    
    convenience init(viewModel: BrewDetailViewModel, ingredientsButtonAction: @escaping () -> Void) {
        self.init()
        self.viewModel = viewModel
        self.ingredientsButtonAction = ingredientsButtonAction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = viewModel?.title
        
        setupLabels()
    }
    
    @IBAction func ingredientsButtonTapped(_ sender: Any) {
        ingredientsButtonAction?()
    }
    
    // MARK: - private
    private func setupLabels() {
        abvLabel.text = viewModel?.abv
        ibuLabel.text = viewModel?.ibu
        targetFgLabel.text = viewModel?.targetFg
        targetOgLabel.text = viewModel?.targetOg
        ebcLabel.text = viewModel?.ebc
        srmLabel.text = viewModel?.srm
        phLabel.text = viewModel?.ph
        attenuationLevelLabel.text = viewModel?.attenuationLevel
        volumeLabel.text = viewModel?.volume
        boilVolumeLabel.text = viewModel?.boilVolume
        ingredientsButton.setTitle(viewModel?.ingredientsButtonTitle, for: .normal)
    }
}
