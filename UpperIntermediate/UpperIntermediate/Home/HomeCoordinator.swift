//
//  HomeViewController.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/3/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import UIKit

final class HomeCoordinator: CoordinatorType {
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        
        viewModel.viewDelegate = viewController
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
