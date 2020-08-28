//
//  LineChartViewModel.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 17/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import Foundation
class LineChartViewModel {
    
    var dataSource = [String]()
    
    func noOfRows() -> Int {
        return dataSource.count
    }
    
    func getCellItem(atIndex index: Int) -> String {
        guard index < dataSource.count else { return "" }
        return dataSource[index]
    }
    
    init() {
        for data in AnimationOptions.allCases {
            dataSource.append(data.rawValue)
        }
    }
}
