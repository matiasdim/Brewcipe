//
//  BrewCellTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 13/06/22.
//

import XCTest
@testable import Brewcipe

class BrewCellTests: XCTestCase {
    
    func test_brewCell_outletsConected() {
        let sut = makeSut()!
        
        XCTAssertNotNil(sut.nameLabel)
        XCTAssertNotNil(sut.taglineLabel)
        XCTAssertNotNil(sut.abvLabel)
        XCTAssertNotNil(sut.ibuLabel)
        XCTAssertNotNil(sut.targetFgLabel)
        XCTAssertNotNil(sut.targetOgLabel)
        XCTAssertNotNil(sut.brewImageView)
    }
    
    func test_brewCell_corectlySetsLabelsTexts() {
        let sut = makeSut()!
        
        sut.configure(name: "name", tagline: "tagline", abv: "abv", ibu: "ibu", targetFg: "fg", targetOg: "og", brewImage: .remove)
        
        XCTAssertEqual(sut.nameLabel.text, "name")
        XCTAssertEqual(sut.taglineLabel.text, "tagline")
        XCTAssertEqual(sut.abvLabel.text, "abv")
        XCTAssertEqual(sut.ibuLabel.text, "ibu")
        XCTAssertEqual(sut.targetFgLabel.text, "fg")
        XCTAssertEqual(sut.targetOgLabel.text, "og")
        XCTAssertEqual(sut.brewImageView.image, UIImage.remove)
    }

    // MARK: - Helpers
    
    private func makeSut() -> BrewCell? {
        let bundle = Bundle(for: BrewCell.self)
        guard let brewCell = bundle.loadNibNamed("BrewCell", owner: nil)?.first as? BrewCell else {
            XCTFail("Failed to load BrewCell nib", file: #file, line: #line)
            return nil
        }
        
        return brewCell
    }
    
}
