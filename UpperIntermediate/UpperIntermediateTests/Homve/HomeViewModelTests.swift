//
//  HomeViewModelTests.swift
//  UpperIntermediateTests
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import XCTest
@testable import UpperIntermediate

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockDataService: MockDataService!

    override func setUp() {
        mockDataService = MockDataService()
        viewModel = HomeViewModel(randomDataService: mockDataService)
    }

    override func tearDown() {
        mockDataService = nil
        viewModel = nil
    }

    func testDataSouceInfo() {
        XCTAssertEqual(viewModel.numberOfRowsInSection, mockDataService.mockedStrings.count)
        
        let model = viewModel.getModel(forCellForRowAt: IndexPath(row: 2, section: 0))
        XCTAssertEqual(model?.title, mockDataService.mockedStrings[2])
        
        
    }
    
    class MockDataService: RandomStringsDataServiceType {
        let mockedStrings = ["1","2","3","4","5","6","7","8","9","10"]
        
        func fetch(completionHandler: @escaping ([String]?, Error?) -> Void) {
            completionHandler(mockedStrings, nil)
        }
    }
}
