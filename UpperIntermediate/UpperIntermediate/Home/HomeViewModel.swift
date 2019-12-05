//
//  HomeViewModel.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/3/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var numberOfRowsInSection: Int { get }
    func getModel(forCellForRowAt indexPath: IndexPath) -> HomeCellModelType?
}

class HomeViewModel: HomeViewModelProtocol {
    private var tableData = [HomeCellModelType]()
    private let randomDataService: RandomStringsDataServiceType
    
    weak var viewDelegate: HomeViewControllerDelegate?
    
    init(randomDataService: RandomStringsDataServiceType = RandomStringsDataService()) {
        self.randomDataService = randomDataService
        
        fetchData()
    }
    
    var numberOfRowsInSection: Int {
        return tableData.count
    }
    
    func getModel(forCellForRowAt indexPath: IndexPath) -> HomeCellModelType? {
        guard indexPath.row < tableData.count else { return nil }
        return tableData[indexPath.row]
    }
    
    private func fetchData() {

        randomDataService.fetch() { [weak self] strings, error in
            guard let strings = strings, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.tableData = strings.map { HomeCellModel(title: $0) }
                self?.viewDelegate?.reloadTableView()
            }
        }
    }
}
