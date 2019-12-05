//
//  SignInViewModelTests.swift
//  UpperIntermediateTests
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import XCTest
@testable import UpperIntermediate

class SignInViewModelTests: XCTestCase {
    
    var viewModel: SignInViewModel!
    var mockDelegate: MockSignInViewControllerDelegate!
    var onSuccessedLoginTapped: Bool!

    override func setUp() {
        viewModel = SignInViewModel()
        mockDelegate = MockSignInViewControllerDelegate()
        viewModel.viewDelegate = mockDelegate
        onSuccessedLoginTapped = false
        
        viewModel.onSuccessedLogin = {
            self.onSuccessedLoginTapped = true
        }
    }

    override func tearDown() {
        viewModel = nil
        mockDelegate = nil
        onSuccessedLoginTapped = nil
    }

    func testShowingAlertForInccorectLoginOrPassword() {
        viewModel.loginFieldDidChange(with: "test")
        viewModel.passwordDidChange(with: "test")
        
        viewModel.signInTapped()
        
        XCTAssertTrue(mockDelegate.didShowAlert)
        XCTAssertFalse(onSuccessedLoginTapped)
    }
    
    func testSuccessLogin() {
        viewModel.loginFieldDidChange(with: "user")
        viewModel.passwordDidChange(with: "123qwe")
        
        viewModel.signInTapped()
        
        XCTAssertFalse(mockDelegate.didShowAlert)
        XCTAssertTrue(onSuccessedLoginTapped)
    }
    
    class MockSignInViewControllerDelegate: SignInViewControllerDelegate {
        var didShowAlert = false
        
        func showCredentialsError() {
            didShowAlert = true
        }
    }
}
