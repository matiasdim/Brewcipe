//
//  BrewViewControllerFactoryTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 5/06/22.
//

import XCTest
@testable import Brewcipe

class BrewViewControllerFactoryTests: XCTestCase {
    
    func test_brewsViewController_shouldReturnBrewListViewController() {
        let sut = makeSUT()
        let brewListVC = sut.brewsViewController(for: [], selection: {_ in }) as? BrewListViewController

        XCTAssertNotNil(brewListVC, "brewListVC")
    }
    
    func test_brewsViewController_createsControllerWithViewModel() {
        let sut = BrewViewControllerFactory()
        let brewListVC = sut.brewsViewController(for: [], selection: {_ in }) as? BrewListViewController
         
        XCTAssertNotNil(brewListVC?.viewModel)
    }
    
    func test_brewDetailViewController_shouldReturnBrewDetailViewController() {
        let sut = makeSUT()
        let brew = makeBrew()
        let brewDetailVC = sut.brewDetailViewController(for: brew) as? BrewDetailViewController
        
        XCTAssertNotNil(brewDetailVC, "brewDetailVC")
    }
    
    func test_brewDetailViewController_createsControllerWithViewModel() {
        let sut = makeSUT()
        let brew = makeBrew()
        let brewDetailVC = sut.brewDetailViewController(for: brew) as? BrewDetailViewController
        
        XCTAssertNotNil(brewDetailVC?.viewModel)
    }
    
    func test_recipeViewController_shouldReturnRecipeViewController() {
        let sut = makeSUT()
        let recipeVC = sut.recipeViewController(for: makeRecipeDetail()) as? RecipeViewController
        
        XCTAssertNotNil(recipeVC, "recipeVC")
    }
    
    func test_recipeViewController_createsControllerWithRecipeString() {
        let sut = makeSUT()
        let recipeVC = sut.recipeViewController(for: makeRecipeDetail()) as? RecipeViewController

        XCTAssertNotNil(recipeVC?.recipe, "recipeVC")
    }

    // MARK: - Helpers
    private func makeSUT() -> BrewViewControllerFactory {
        BrewViewControllerFactory()
    }
    
    private func makeBrew() -> Brew {
        Brew(name: "Brew", tagline: "tagline", imageUrl: nil, abv: 0.0, ibu: 0, targetFg: 0, targetOg: 0)
    }
    
    private func makeRecipeDetail() -> String {
        "This is the brew recipe"
    }
}
