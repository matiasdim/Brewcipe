//
//  NavigationControllerRouter.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import XCTest
@testable import Brewcipe

class NavigationControllerRouterTests: XCTestCase {

    func test_navigationControllerAndViewControllerFactory_shouldExists() {
        let factory = ViewControllerFactoryStub()
        let sut = NavigationControllerRouter(navigationController: UINavigationController(), viewControllerFactory: factory)
        
        XCTAssertNotNil(sut.navigationController)
        XCTAssertNotNil(sut.viewControllerFactory)
    }

        
    func test_showDetail_shouldShowDetailViewController() {
        let factory = ViewControllerFactoryStub()
        let sut = NavigationControllerRouter(navigationController: UINavigationController(), viewControllerFactory: factory)
        sut.navigationController.loadViewIfNeeded()
        
        
        XCTAssertNotNil(sut.viewControllerFactory)
    }
    
    // MARK: - Helpers
    
    private class ViewControllerFactoryStub: ViewControllerFactory {
        
        func listViewController(for brews: [Brew]) -> UITableViewController {
            
        }
        
        func detailViewController(for brew: Brew) -> UIViewController {
            <#code#>
        }
        
        
    }

}
