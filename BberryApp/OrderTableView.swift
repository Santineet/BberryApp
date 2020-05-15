//
//  OrderTableView.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 11.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class OrderTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    let cellIndefire = "orderCell"
    var cells = [GoodsModel]()
    
    init() {
           super.init(frame: .zero, style: UITableView.Style.plain)
           translatesAutoresizingMaskIntoConstraints = false
           delegate = self
           dataSource = self
           backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
           separatorStyle = .none
           let nibCell = UINib(nibName: "OrderTableCell", bundle: nil)
           register(nibCell, forCellReuseIdentifier: cellIndefire)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [GoodsModel]) {
        self.cells = cells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: cellIndefire, for: indexPath) as! OrderTableCell
        let index = cells[indexPath.row]
        cell.goodsImage.image = index.mainImage
        cell.goodsName.text = index.sushiName
        cell.goodsPrice.text = String(index.cost) + " " + "руб"
        return cell
    }
    



}
