//
//  GoodsModel.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 07.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import Foundation

import UIKit

struct GoodsModel {
    var mainImage: UIImage
    var sushiName: String
    var smallDescription: String
    var cost: Int
    var category: String
    
    static func fetchSushi() -> [GoodsModel] {
        let firstItem = GoodsModel(mainImage: UIImage(named: "ic_can#1")!,
                               sushiName: "Beer#2",
                               smallDescription: "Original Japanese",
                               cost: 99, category: "Сори")
        let secondItem = GoodsModel(mainImage: UIImage(named: "ic_can#2")!,
                                    sushiName: "Beer#2",
                                    smallDescription: "Original Japanese",
                                    cost: 1100, category: "Сушри")
        let thirdItem = GoodsModel(mainImage: UIImage(named: "ic_can#1")!,
                                   sushiName: "Camaron",
                                   smallDescription: "Original Japanese",
                                   cost: 15, category: "Мьянка")
        
        let fouthItem = GoodsModel(mainImage: UIImage(named: "ic_can#2")!,
                                   sushiName: "Salmon",
                                   smallDescription: "Original Japanese",
                                   cost: 120, category: "Суши")

        let five = GoodsModel(mainImage: UIImage(named: "ic_can#1")!,
                                   sushiName: "Jengibre",
                                   smallDescription: "Original Japanese",
                                   cost: 8, category: "Категория")
        let six = GoodsModel(mainImage: UIImage(named: "ic_can#2")!,
                                    sushiName: "Caviar",
                                    smallDescription: "Original Japanese",
                                    cost: 10, category: "Что то там")
        let seven = GoodsModel(mainImage: UIImage(named: "ic_can#1")!,
                                   sushiName: "Camaron",
                                   smallDescription: "Original Japanese",
                                   cost: 7, category: "Кое что")
        
        let eight = GoodsModel(mainImage: UIImage(named: "ic_can#2")!,
                                   sushiName: "Salmon",
                                   smallDescription: "Original Japanese",
                                   cost: 12, category: "Последняя")
        
        return [firstItem, secondItem, thirdItem, fouthItem, five, six, seven, eight]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}



