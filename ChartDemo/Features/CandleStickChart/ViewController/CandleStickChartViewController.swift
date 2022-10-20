//
//  CandleStickChartViewController.swift
//  ChartDemo
//
//  Created by Fani on 20.10.22.
//  Copyright © 2022 Randhir Kumar. All rights reserved.
//

import UIKit
import Charts

class CandleStickChartViewController: UIViewController {
    @IBOutlet private weak var candleStickChartView: CandleStickChartView!
    @IBOutlet private weak var animationSegmentControl: UISegmentedControl!
    
    private var hideChartData = false
    var animationSelected: AnimationOptions = .linear {
        didSet {
            updateChartData()
            setCandleChartData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ChartType.candleStickChart.rawValue
        setCandleChartData()
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
            candleStickChartView.data = nil
            return
        }
    }
    
    func setCandleChartData() {
        candleStickChartView.autoScaleMinMaxEnabled = true
        setCandleDataCount(8, range: 30)
    }
    
    func setCandleDataCount(_ count: Int, range: UInt32) {
        let animationType: ChartEasingOption  = animationSelected == AnimationOptions.linear ? .linear : animationSelected == AnimationOptions.easeInCubic ? .easeInCubic : .easeOutCubic
        
        let yVals1 = (0..<count).map { (i) -> CandleChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(40) + mult)
            let high = Double(arc4random_uniform(9) + 8)
            let low = Double(arc4random_uniform(9) + 8)
            let open = Double(arc4random_uniform(6) + 1)
            let close = Double(arc4random_uniform(6) + 1)
            let even = i % 2 == 0

            return CandleChartDataEntry(x: Double(i), shadowH: val + high, shadowL: val - low, open: even ? val + open : val - open, close: even ? val - close : val + close)
        }
        
        
        let set1 = CandleChartDataSet(entries: yVals1, label: "Data Set")
        set1.colors = ChartColorTemplates.colorful()
        let data = CandleChartData(dataSet: set1)
        
        candleStickChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        candleStickChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: animationType)
        
        candleStickChartView.data = data
    }
}
