//
//  HomeViewController.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/3/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//


import Foundation

protocol SignInViewModelType {
    func loginFieldDidChange(with text: String)
    func passwordDidChange(with text: String)
    func signInTapped()
}

class SignInViewModel: SignInViewModelType {
    var onSuccessedLogin: (() -> ())?
    
    weak var viewDelegate: SignInViewControllerDelegate!
    
    private var login = ""
    private var password = ""
    
    func signInTapped() {
        
        let correctLogin = "user"
        let correctPassword = "123qwe"
        
        if login == correctLogin && password == correctPassword {
            onSuccessedLogin?()
        } else {
            viewDelegate.showCredentialsError()
        }
    }
    
    func loginFieldDidChange(with text: String) {
        login = text
    }
    
    func passwordDidChange(with text: String) {
        password = text
    }
}
