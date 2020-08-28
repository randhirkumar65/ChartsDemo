//
//  ChartsViewModel.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

class ChartsViewModel {
    
    var dataSource = [Charts]()
    
    init(data: [Charts]) {
        self.dataSource = data
    }
    
    func numberOfRows() -> Int {
        return dataSource.count
    }
    
    func getCellItem(atIndex index: Int) -> Charts? {
        guard index < dataSource.count else { return nil }
        return dataSource[index]
    }
}
