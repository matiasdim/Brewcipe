//
//  BrewViewControllerFactoryTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 5/06/22.
//

import XCTest
@testable import Brewcipe
import SwiftCollections

class BrewViewControllerFactoryTests: XCTestCase {
    
    func test_brewsViewController_shouldReturnBrewListViewController() {
        let sut = makeSUT()
        let brewListVC = sut.brewsViewController(for: [], selection: {_ in }) as? BrewListViewController

        XCTAssertNotNil(brewListVC, "brewListVC")
    }
    
    func test_brewsViewController_createsControllerWithViewModel() {
        let sut = makeSUT()
        let brewListVC = sut.brewsViewController(for: [], selection: {_ in }) as? BrewListViewController
         
        XCTAssertNotNil(brewListVC?.viewModel)
    }
    
    func test_brewsViewController_itemIsSelected_shouldFireCallback() {
        let sut = makeSUT()
        var callbackWasFired = false
        let brewListVC = sut.brewsViewController(for: [makeBrew()], selection: { _ in callbackWasFired = true }) as! BrewListViewController
        brewListVC.loadViewIfNeeded()
        
        brewListVC.tableView(brewListVC.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(callbackWasFired)
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
    
    func test_ingredientsViewController_shouldReturnIingredientsViewControllerr() {
        let sut = makeSUT()
        let ingredientsVC = sut.ingredientsViewController(for: makeRecipeDetail()) as? IngredientsViewController
        
        XCTAssertNotNil(ingredientsVC, "ingredientsVC")
    }
    
    func test_ingredientsViewController_createsControllerWithRecipeString() {
        let sut = makeSUT()
        let ingredientsVC = sut.ingredientsViewController(for: makeRecipeDetail()) as? IngredientsViewController

        XCTAssertNotNil(ingredientsVC?.recipe, "ingredientsVC")
    }

    // MARK: - Helpers
    private func makeSUT() -> BrewViewControllerFactory {
        BrewViewControllerFactory()
    }
    
    private func makeBrew() -> Brew {
        let ingredients: OrderedDictionary<String, Any> = OrderedDictionary.init(uniqueKeys: ["yeast", "another"], values: ["Wyeast 1272 - American Ale II™", "aaa ooo pppp"])

        return Brew(name: "Brew",
                     tagline: "tagline",
                     imageUrl: nil,
                     abv: 0.0,
                     ibu: 0,
                     targetFg: 0,
                     targetOg: 0,
                     ebc: 19.5,
                     srm: 9.9,
                     ph: 4.4,
                     attenuationLevel: 75.6,
                     volume: [20: "litres"],
                     boilVolume: [25: "litres"],
                     description: "A description of the brew",
                     ingredients: ingredients)
    }
    
    private func makeRecipeDetail() -> String {
        "This is the brew recipe"
    }
}
