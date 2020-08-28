//
//  PieChartViewController.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        title = ChartType.pieChart.rawValue
        setChartData()
    }
    
    func setChartData() {
        var pieData = [PieChartDataEntry]()

        for i in 0...15 {
            pieData.append(PieChartDataEntry(value: Double(i) + Double.random(in: 5...20), label: "Item\(i)"))
        }
        
        let set = PieChartDataSet(entries: pieData, label: "Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        set.colors = ChartColorTemplates.pastel()
        + ChartColorTemplates.colorful()
        + ChartColorTemplates.liberty()
        + ChartColorTemplates.joyful()
        + ChartColorTemplates.vordiplom()
        + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 14, weight: .light))
        data.setValueTextColor(.systemIndigo)
        
        pieChartView.data = data
    }
}
