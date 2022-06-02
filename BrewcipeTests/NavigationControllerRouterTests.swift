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
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        
        XCTAssertNotNil(sut.navigationController)
        XCTAssertNotNil(sut.factory)
    }

        
    func test_selectedBrew_shouldShowBrewDetailViewController() {
        let factory = ViewControllerFactoryStub()
        let brew = Brew()
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        
        sut.selected(brew)
        
        XCTAssertEqual(sut.navigationController.viewControllers.count, 2)
    }
    
    func test_showRecipeDetailFoBrew_shouldShowRecipeViewModally() {
        let factory = ViewControllerFactoryStub()
        let brew = Brew()
        let sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        
        XCTAssertEqual(navigationController.presentCallCount, 0)
        
        sut.showRecipeDetail(for: brew)
        
        XCTAssertEqual(navigationController.presentCallCount, 1)
    }
    
    // MARK: - Helpers
    private let navigationController = NonAnimatedNavigationController(rootViewController: UITableViewController())
    
    private class NonAnimatedNavigationController: UINavigationController {
        var presentCallCount = 0
        var presentedArgsViewController = [UIViewController]()
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: false)
        }
        
        override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
            presentCallCount += 1
            presentedArgsViewController.append(viewControllerToPresent)
        }
    }
    
    private class ViewControllerFactoryStub: BrewViewControllerFactory {
        
        func listViewController(for brews: [Brew]) -> UITableViewController {
            return UITableViewController()
        }
        
        func detailViewController(for brew: Brew) -> UIViewController {
            return UIViewController()
        }
        
        func recipeViewController(for brew: Brew) -> UIViewController {
            return UIViewController()
        }
    }

}
