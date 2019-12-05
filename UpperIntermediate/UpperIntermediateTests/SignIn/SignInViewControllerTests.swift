//
//  SignInViewControllerTests.swift
//  UpperIntermediateTests
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import XCTest
@testable import UpperIntermediate

class SignInViewControllerTests: XCTestCase {

    var viewController: SignInViewController!
    var mockViewModel: MockSignInViewModel!
    
    override func setUp() {
        mockViewModel = MockSignInViewModel()
        viewController = SignInViewController(viewModel: mockViewModel)
    }

    override func tearDown() {
        mockViewModel = nil
        viewController = nil
    }

    func testExample() {
        let testText = "testText"
        
        let loginTextField = UITextField()
        let passwordTextField = UITextField()
        viewController.loginTextField = loginTextField
        viewController.passwordTextField = passwordTextField
        
        passwordTextField.text = testText
        loginTextField.text = testText
        
        viewController.textFieldDidChangeSelection(loginTextField)
        viewController.textFieldDidChangeSelection(passwordTextField)
        
        XCTAssertEqual(mockViewModel.login, testText)
        XCTAssertEqual(mockViewModel.password, testText)
    }
    
    func testOnSignIn() {
        viewController.onSignIn(UIButton())
        XCTAssertTrue(mockViewModel.isSignInTapped)
    }

    class MockSignInViewModel: SignInViewModelType {
        var login: String = ""
        var password: String = ""
        var isSignInTapped = false
        
        func loginFieldDidChange(with text: String) {
            login = text
        }
        
        func passwordDidChange(with text: String) {
            password = text
        }
        
        func signInTapped() {
            self.isSignInTapped = true
        }
        
        
    }

}
