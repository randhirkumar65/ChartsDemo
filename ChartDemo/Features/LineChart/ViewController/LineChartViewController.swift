//
//  LineChartViewController.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet private weak var animationSegmentControl: UISegmentedControl!
    
    private var viewModel = LineChartViewModel()
    private var hideChartData = false
    
    private var animation: ChartEasingOption = .easeInBack {
        didSet {
            updateChartData()
            setChartData()
        }
    }
    
    override func viewDidLoad() {
        title = ChartType.lineChart.rawValue
        setupCollectionView()
        registerCell()
        setChartData()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "AnimationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimationCollectionViewCell")
    }
    
    private func setChartData() {
        var chartEntries = [ChartDataEntry]()
        for i in 0...15 {
            chartEntries.append(ChartDataEntry(x: Double(i), y: Double(i) + Double.random(in: 2...50)))
        }
        let set1 = LineChartDataSet(entries: chartEntries, label: "DataSet 1")
        set1.drawIconsEnabled = false
        set1.setColor(.systemPink)
        set1.setCircleColor(.systemRed)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        set1.drawValuesEnabled = true
        set1.mode = .cubicBezier
        set1.cubicIntensity = 0.3
        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        set1.drawFilledEnabled = true
        set1.drawCirclesEnabled = false
        let data = LineChartData(dataSet: set1)
        lineChartView.animate(yAxisDuration: 3.0, easingOption: animation)
        lineChartView.data = data
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let compositionalLayout = UICollectionViewCompositionalLayout { (_,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in

            
            // create an item representing each card
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(60.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // create a group representing each row
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(40))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            
            // create a section containing all the groups
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging

            return section
        }
        return compositionalLayout
    }
    
    func updateChartData()  {
        if hideChartData {
            hideChartData = false
            lineChartView.data = nil
            return
        }
    }
}

// MARK: - Collection View Cell delegate and Datasource
extension LineChartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.noOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimationCollectionViewCell", for: indexPath) as! AnimationCollectionViewCell
        cell.configCell(with: viewModel.getCellItem(atIndex: indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        hideChartData = true
        animation = ChartEasingOption(rawValue: indexPath.row) ?? ChartEasingOption.easeInCubic
    }
}
