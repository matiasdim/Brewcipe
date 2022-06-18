//
//  IngredientCellTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 18/06/22.
//

import XCTest
@testable import Brewcipe

class IngredientCellTests: XCTestCase {

    func test_ingredientCellClassName_shoudBeIngredientCell() {
        XCTAssertEqual(IngredientCell.ingredientCellClassName, "IngredientCell")
    }
    
    func test_ingredientCell_shouldHaveOutletsConnected() {
        let sut = makeSut()
        
        XCTAssertNotNil(sut?.titleLabel)
        XCTAssertNotNil(sut?.subtitleLabel)
    }
    
    func test_configure_correctly_setsTexts() {
        let sut = makeSut()
        
        sut?.configure(title: "title", subtitle: "subtitle")
        
        XCTAssertEqual(sut?.titleLabel.text, "title")
        XCTAssertEqual(sut?.subtitleLabel.text, "subtitle")
    }
    
    // MARK: - Helpers
    
    private func makeSut() -> IngredientCell? {
        let bundle = Bundle(for: IngredientCell.self)
        guard let ingredientCell = bundle.loadNibNamed("IngredientCell", owner: nil)?.first as? IngredientCell else {
            XCTFail("Failed to load IngredientCell nib", file: #file, line: #line)
            return nil
        }
        
        return ingredientCell
    }

}
