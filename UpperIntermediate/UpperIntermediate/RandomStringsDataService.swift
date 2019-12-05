//
//  RandomDataService.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/5/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import Foundation

protocol RandomStringsDataServiceType {
    func fetch(completionHandler: @escaping ([String]?, Error?) -> Void)
}

class RandomStringsDataService: RandomStringsDataServiceType {
    private let stringUrl = "https://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
    
    func fetch(completionHandler: @escaping ([String]?, Error?) -> Void) {
        let url = URL(string: stringUrl)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                let strings = String(decoding: data, as: UTF8.self).split(separator: "\n").map { String($0) }
                completionHandler(strings, nil)
            } else {
                completionHandler(nil, nil)
            }
        }
        
        task.resume()
    }
}
