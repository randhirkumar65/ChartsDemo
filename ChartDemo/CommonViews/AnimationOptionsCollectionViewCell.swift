//
//  AnimationOptionsCollectionViewCell.swift
//  ChartDemo
//
//  Created by Randhir Kumar on 17/08/20.
//  Copyright © 2020 Randhir Kumar. All rights reserved.
//

import UIKit

class AnimationOptionsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8.0
    }
    
    func configCell(with title: String) {
        if let label = titleLabel {
            label.text = title
            
        }
    }
}
