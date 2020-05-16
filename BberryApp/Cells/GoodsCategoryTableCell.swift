//
//  GoodsCategoryTableCell.swift
//  BberryApp
//
//  Created by Mairambek on 5/16/20.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

protocol GoodsCategoryDelegate: class {
    func changedCategory(at index: Int?)
}

class GoodsCategoryTableCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private var goods: [GoodsModel] = []
    
    weak var delegate: GoodsCategoryDelegate?
    
    private var selectedCategoryIndex: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GoodsCategoryCell.nib, forCellWithReuseIdentifier: GoodsCategoryCell.identifier)
    }
    
    func setupCell(with goods: [GoodsModel], delegate: GoodsCategoryDelegate) {
        self.delegate = delegate
        self.goods = goods
    }
}

extension GoodsCategoryTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return goods.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoodsCategoryCell.identifier, for: indexPath) as! GoodsCategoryCell
        let isSelected = indexPath.row == selectedCategoryIndex
        if indexPath.row == 0 {
            cell.setupCell(with: nil, isSelected: isSelected)
        } else {
            cell.setupCell(with: goods[indexPath.row - 1], isSelected: isSelected)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.changedCategory(at: nil)
        } else {
            delegate?.changedCategory(at: indexPath.row - 1)
        }
        self.selectedCategoryIndex = indexPath.row
    }
}

extension GoodsCategoryTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 70, height: 30)
        }
        let name = goods[indexPath.row - 1].category
        let width = name.widthWithConstrainedHeight(30, font: UIFont(name: "Roboto-Regular", size: 12)!)
        print(width)
        return CGSize(width: width + 40, height: 30)
    }
}
