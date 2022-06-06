//
//  NavigationControllerRouter.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import XCTest
@testable import Brewcipe

class NavigationControllerRouterTests: XCTestCase {
    
    private var factory: ViewControllerFactoryStub!
    private var brew: Brew!
    private var navigationController: NonAnimatedNavigationController!
    private var sut: NavigationControllerRouter!
    
    override func setUp() {
        super.setUp()
        factory = ViewControllerFactoryStub()
        brew = Brew(name: "B1", tagline: "T1", imageUrl: nil, abv: 9.2, ibu: 90, targetFg: 900, targetOg: 890)
        navigationController = NonAnimatedNavigationController(rootViewController: factory.brewsViewController(for: []))
        sut = NavigationControllerRouter(navigationController: navigationController, factory: factory)
    }
    
    override func tearDown() {
        factory = nil
        brew = nil
        navigationController = nil
        sut = nil
        super.tearDown()
    }

    func test_navigationControllerAndViewControllerFactory_shouldExists() {
        XCTAssertNotNil(sut.navigationController)
        XCTAssertNotNil(sut.factory)
    }

        
    func test_selectedBrew_shouldShowBrewDetailViewController() {
        sut.selected(brew)
        
        XCTAssertEqual(sut.navigationController.viewControllers.count, 2)
    }
    
    func test_showRecipeDetailFoBrew_shouldShowRecipeViewModally() {
        XCTAssertEqual(navigationController.presentCallCount, 0)
        
        sut.showRecipeDetail(for: brew)
        
        XCTAssertEqual(navigationController.presentCallCount, 1)
    }
    
    // MARK: - Helpers
    
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
    
    private class ViewControllerFactoryStub: ViewControllerFactory {
        func recipeViewController(for recipe: String) -> UIViewController {
            UIViewController()
        }
        
        func brewsViewController(for brews: [Brew]) -> UIViewController {
            return UIViewController()
        }
        
        func brewDetailViewController(for brew: Brew) -> UIViewController {
            return UIViewController()
        }
    }

}
