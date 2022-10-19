//
//  BubbleChartViewController.swift
//  ChartDemo
//
//  Created by Kevin Vishal on 19/10/22.
//  Copyright © 2022 Randhir Kumar. All rights reserved.
//

import Foundation
import Charts

class BubbleChartViewController: UIViewController {
    @IBOutlet private weak var bubbleChartView: BubbleChartView!
    @IBOutlet private weak var animationSegmentControl: UISegmentedControl!
    
    private var hideChartData = false
    var animationSelected: AnimationOptions = .linear {
        didSet {
            updateChartData()
            setBubbleChartData()
        }
    }
    override func viewDidLoad() {
        title = ChartType.bubbbleChart.rawValue
        setBubbleChartData()
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
            bubbleChartView.data = nil
            return
        }
    }
    
    func setBubbleChartData() {
        let animationType: ChartEasingOption  = animationSelected == AnimationOptions.linear ? .linear : animationSelected == AnimationOptions.easeInCubic ? .easeInCubic : .easeOutCubic
        
        var bubbleEntries = [BubbleChartDataEntry]()

        
        for i in 0...15 {
            let area = Double(Int.random(in: 12...20))
            bubbleEntries.append(BubbleChartDataEntry(x: Double(i), y: Double(i) + Double(Int.random(in: 5...20)), size: CGFloat(area)))
        }
        let chartDataSet = BubbleChartDataSet(entries: bubbleEntries, label: "Profit so far")
        // Set Data Set Colors to Colorful templates
        print("COUNT \(chartDataSet.maxSize)")
        chartDataSet.colors = ChartColorTemplates.vordiplom()

        let chartData = BubbleChartData(dataSet: chartDataSet)
        bubbleChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        bubbleChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: animationType)
        bubbleChartView.data = chartData
    }
}
