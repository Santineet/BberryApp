//
//  OrderTableCell.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 15.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class OrderTableCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bgButton: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodsName: UILabel!
    @IBOutlet weak var goodsPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        bgView.layer.cornerRadius = 10
        bgView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        bgView.layer.shadowRadius = 2.0
        bgView.layer.shadowOpacity = 0.5
        bgView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        bgButton.clipsToBounds = true
        bgButton.roundCorners(corners: [.bottomRight , .topRight], radius: 10)
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
