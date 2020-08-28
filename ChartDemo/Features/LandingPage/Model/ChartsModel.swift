//
//  ChartsModel.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import Foundation

struct Charts {
    let chart: ChartType

}

enum ChartType: String {
    case barChart = "Bar Chart"
    case lineChart = "Line Chart"
    case pieChart = "Pie Chart"
}
