//
//  GoodsTableCell.swift
//  BberryApp
//
//  Created by Mairambek on 5/16/20.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class GoodsTableCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var goods: [GoodsModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupCollectionView()
    }

    func setupCell(with goods: [GoodsModel]) {
        self.goods = goods
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GoodsCollectionCell.nib,
                                forCellWithReuseIdentifier: GoodsCollectionCell.identifier)
    }
}

extension GoodsTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return goods.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoodsCollectionCell.identifier, for: indexPath) as! GoodsCollectionCell
        cell.setupCell(with: goods[indexPath.row])
        
        return cell
    }

}

extension GoodsTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) + 20, height: collectionView.frame.height)
    }
}
