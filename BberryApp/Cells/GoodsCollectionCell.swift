//
//  GoodsCollectionCell.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 11.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class GoodsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var goodsImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.dropShadow()
    }

    func setupCell(with goods: GoodsModel) {
        goodsImageView.image = goods.mainImage
        nameLabel.text = goods.sushiName
        priceLabel.text = "\(goods.cost) руб"
        categoryLabel.text = goods.category
    }
    
    @IBAction func addGoods(_ sender: UIButton) {
        
    }
}
