//
//  DictionaryExtensionsTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 13/06/22.
//

import XCTest
@testable import Brewcipe

class DictionaryExtensionsTests: XCTestCase {

    func test_keyAndValueConcatenated_withValidData_shouldReturnConcatenatedString() {
        let sut = [20.0: "Cows"]
        
        XCTAssertEqual(sut.keyAndValueConcatenated(), "20.0 Cows")
    }
    
    func test_keyAndValueConcatenated_withNoData_shouldReturnNil() {
        let sut = [Double :String]()
        
        XCTAssertNil(sut.keyAndValueConcatenated())
    }

}
