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
        let brewListVC = makeBrewListVC(from: makeSUT())

        XCTAssertNotNil(brewListVC, "brewListVC")
    }
    
    func test_brewsViewController_createsControllerWithViewModel() {
        let brewListVC = makeBrewListVC(from: makeSUT())
         
        XCTAssertNotNil(brewListVC?.viewModel)
    }
    
    func test_brewsViewController_itemIsSelected_shouldFireCallback() {        
        var callbackWasFired = false
        
        let brewListVC = makeBrewListVC(from: makeSUT(), brews: [makeBrew()], selection: { _ in callbackWasFired = true })
        brewListVC!.loadViewIfNeeded()
        
        brewListVC!.tableView(brewListVC!.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(callbackWasFired)
    }
    
    func test_brewDetailViewController_shouldReturnBrewDetailViewController() {
        let brewDetailVC = makeBrewDetailVC(makeSUT(), makeBrew())
        
        XCTAssertNotNil(brewDetailVC, "brewDetailVC")
    }
    
    func test_brewDetailViewController_createsControllerWithViewModel() {
        let brewDetailVC = makeBrewDetailVC(makeSUT(), makeBrew())
        
        XCTAssertNotNil(brewDetailVC?.viewModel)
    }
    
    func test_ingredientsViewController_shouldReturnIingredientsViewControllerr() {
        let ingredientsVC = makeIngredientsVC(makeSUT(), makeBrew())
        
        XCTAssertNotNil(ingredientsVC, "ingredientsVC")
    }
    
    func test_ingredientsViewController_createsControllerWithViewModel() {        
        let ingredientsVC = makeIngredientsVC(makeSUT(), makeBrew())

        XCTAssertNotNil(ingredientsVC?.viewModel)
    }

    // MARK: - Helpers
    private func makeIngredientsVC(_ sut: BrewViewControllerFactory, _ brew: Brew) -> IngredientsViewController? {
        return sut.ingredientsViewController(for: brew.ingredients) as? IngredientsViewController
    }
    
    private func makeBrewDetailVC(_ sut: BrewViewControllerFactory, _ brew: Brew) -> BrewDetailViewController? {
        return sut.brewDetailViewController(for: brew) as? BrewDetailViewController
    }
    
    private func makeBrewListVC(from sut: BrewViewControllerFactory, brews: [Brew] = [], selection: @escaping (Brew) -> Void = {_ in }) -> BrewListViewController? {
        return sut.brewsViewController(for: brews, selection: selection) as? BrewListViewController
    }
    
    private func makeSUT() -> BrewViewControllerFactory {
        BrewViewControllerFactory()
    }
    
    private func makeBrew() -> Brew {
        let ingredients: Ingredients = OrderedDictionary.init(uniqueKeys: ["yeast", "another"], values: ["Wyeast 1272 - American Ale II™", "aaa ooo pppp"])

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
}
