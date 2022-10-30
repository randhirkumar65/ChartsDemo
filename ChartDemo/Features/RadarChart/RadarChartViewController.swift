//
//  RadarChartViewController.swift
//  ChartDemo
//
//  Created by vpatil6 on 30/10/22.
//  Copyright © 2022 Randhir Kumar. All rights reserved.
//

import UIKit
import Charts

class RadarChartViewController: UIViewController {

    @IBOutlet private weak var radarStickChartView: RadarChartView!
    @IBOutlet private weak var animationSegmentControl: UISegmentedControl!
    
    private var hideChartData = false
    var animationSelected: ChartEasingOption = .linear {
        didSet {
            updateChartData()
            setRadarChartData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ChartType.radarChart.rawValue
        setRadarChartData()
        animateRadarChart()
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
        animateRadarChart()
    }
    
    private func animateRadarChart() {
        radarStickChartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: animationSelected)
    }
    
    private func updateChartData()  {
        if hideChartData {
            hideChartData = false
            radarStickChartView.data = nil
            return
        }
    }
    
    private func setRadarChartData() {
        setRadarDataCount(8, range: 30)
    }
    
    private func setRadarDataCount(_ count: Int, range: UInt32) {
        let mult: UInt32 = 80
        let min: UInt32 = 20
        let cnt = 5
        
        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))}
        let entries1 = (0..<cnt).map(block)
        let entries2 = (0..<cnt).map(block)
        
        let set1 = RadarChartDataSet(entries: entries1, label: "Last Week")
        set1.setColor(UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1))
        set1.fillColor = UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1)
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.7
        set1.lineWidth = 2
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)
        
        let set2 = RadarChartDataSet(entries: entries2, label: "This Week")
        set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
        set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
        set2.drawFilledEnabled = true
        set2.fillAlpha = 0.7
        set2.lineWidth = 2
        set2.drawHighlightCircleEnabled = true
        set2.setDrawHighlightIndicators(false)
        
        let data: RadarChartData = [set1, set2]
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        
        radarStickChartView.data = data
    }
}
