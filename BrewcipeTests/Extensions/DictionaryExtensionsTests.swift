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
        let sut = [20: "Cows"]
        
        XCTAssertEqual(sut.keyAndValueConcatenated(), "20 Cows")
    }
    
    func test_keyAndValueConcatenated_withNoData_shouldReturnNil() {
        let sut = [Int:String]()
        
        XCTAssertNil(sut.keyAndValueConcatenated(), "20 Cows")
    }

}
