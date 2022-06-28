//
//  StringExtensionsTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 13/06/22.
//

import XCTest
@testable import Brewcipe

class StringExtensionsTests: XCTestCase {

    func test_imagefromURL_withCorrectImageURL_shouldReturnImage() {
        let sut = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
        
        XCTAssertNotNil(sut.imagefromURL)
    }
    
    func test_imagefromURL_withIncorrectImageURL_shouldNotCrashAndBeNil() {
        let sut = "https://www.dummy.com/dummy.png"
        
        XCTAssertNil(sut.imagefromURL)
    }

}
