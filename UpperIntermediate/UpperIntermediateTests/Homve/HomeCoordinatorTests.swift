//
//  HomeCoordinatorTests.swift
//  UpperIntermediateTests
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import XCTest

@testable import UpperIntermediate

class HomeCoordinatorTests: XCTestCase {

    var coordinator: CoordinatorType!
    var navigation: UINavigationController!
    
    override func setUp() {
        navigation = UINavigationController()
        coordinator = HomeCoordinator(with: navigation)
    }

    override func tearDown() {
        navigation = UINavigationController()
        coordinator = nil
    }

    func testNavigationToHomeViewController() {
        coordinator.start()
        XCTAssertTrue(navigation.viewControllers.last is HomeViewController)
    }
}
