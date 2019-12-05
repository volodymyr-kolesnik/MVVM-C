//
//  HomeCellModel.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import Foundation

protocol HomeCellModelType {
    var title: String { get }
}

class HomeCellModel: HomeCellModelType {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
