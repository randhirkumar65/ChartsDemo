//
//  AnimationCollectionViewCell.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 17/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8.0
    }

    func configCell(with title: String) {
        titleLabel.text = title
    }

}
