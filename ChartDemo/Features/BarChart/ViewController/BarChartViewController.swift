//
//  BarChartViewController.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    @IBOutlet private weak var barChartView: BarChartView!
    @IBOutlet private weak var animationSegmentControl: UISegmentedControl!
    
    private var hideChartData = false
    var animationSelected: AnimationOptions = .linear {
        didSet {
            updateChartData()
            setBarChartData()
        }
    }
    override func viewDidLoad() {
        title = ChartType.barChart.rawValue
        
        setBarChartData()
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            animationSelected = .linear
        case 1:
            animationSelected = .easeInCubic
        default:
            animationSelected = .easeOutCubic
        }
        hideChartData = true
    }
    
    func updateChartData()  {
        if hideChartData {
            hideChartData = false
            barChartView.data = nil
            return
        }
    }
    
    func setBarChartData() {
        let animationType: ChartEasingOption  = animationSelected == AnimationOptions.linear ? .linear : animationSelected == AnimationOptions.easeInCubic ? .easeInCubic : .easeOutCubic
        
        var barEntries = [BarChartDataEntry]()

        
        for i in 0...15 {
            barEntries.append(BarChartDataEntry(x: Double(i), y: Double(i) + Double(Int.random(in: 5...20))))
        }
        let chartDataSet = BarChartDataSet(entries: barEntries, label: "Profit so far")
        // Set Data Set Colors to Colorful templates
        chartDataSet.colors = ChartColorTemplates.colorful()
        

        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: animationType)
        barChartView.data = chartData
    }
}
