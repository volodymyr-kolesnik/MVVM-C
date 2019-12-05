//
//  HomeViewController.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/3/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//


import UIKit

final class SignInCoordinator: CoordinatorType {
    let navigationController: UINavigationController

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("SignInCoordinator deinit")
    }
    
    func start() {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        
        viewModel.onSuccessedLogin = { self.loggedIn() }
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func loggedIn() {
        HomeCoordinator(with: navigationController).start()
    }
}
