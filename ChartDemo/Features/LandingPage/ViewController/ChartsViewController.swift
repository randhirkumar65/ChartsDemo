//
//  ChartsViewController.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 16/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import UIKit

class ChartsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var viewModel: ChartsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDataSource()
        setupTableView()
    }
    
    private func setDataSource() {
        viewModel = ChartsViewModel(data: [.init(chart: .barChart), .init(chart: .lineChart), .init(chart: .pieChart)])
    }
    
    private func setupTableView() {
        title = "Charts"
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: CellIdentifiersTypes.chartsTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifiersTypes.chartsTableViewCell.rawValue)
    }
}

// MARK: - Table view delegate and datasource methods
extension ChartsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiersTypes.chartsTableViewCell.rawValue, for: indexPath) as! ChartsTableViewCell
        if let data = viewModel.getCellItem(atIndex: indexPath.row) {
            cell.configCell(with: data.chart.rawValue)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: kBarSequeId, sender: nil)
        case 1:
            performSegue(withIdentifier: kLineSequeId, sender: nil)
        default:
            performSegue(withIdentifier: kPieSequeId, sender: nil)
        }
    }
}
