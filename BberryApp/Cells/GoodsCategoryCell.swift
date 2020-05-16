//
//  GoodsHeaderCollectionCell.swift
//  BberryApp
//
//  Created by Mairambek on 5/16/20.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class GoodsCategoryCell: UICollectionViewCell {

    @IBOutlet weak var isSelectedView: UIView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setupCell(with goods: GoodsModel?, isSelected: Bool) {
        nameLabel.text = goods?.category ?? "Все"
        if isSelected {
            isSelectedView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.7960784314, blue: 0.3254901961, alpha: 1)
            nameLabel.textColor = .white
        } else {
            isSelectedView.backgroundColor = .clear
            nameLabel.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        }
    }
}
