//
//  SignInCoordinatorTests.swift
//  UpperIntermediateTests
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import XCTest

@testable import UpperIntermediate

class SignInCoordinatorTests: XCTestCase {

    var coordinator: CoordinatorType!
    var navigation: UINavigationController!
    
    override func setUp() {
        navigation = UINavigationController()
        coordinator = SignInCoordinator(with: navigation)
    }

    override func tearDown() {
        navigation = UINavigationController()
        coordinator = nil
    }

    func testNavigationToSignInViewController() {
        coordinator.start()
        XCTAssertTrue(navigation.viewControllers.last is SignInViewController)
    }
}
