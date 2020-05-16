//
//  OrderController.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 07.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class OrderController: UIViewController {
    
    private var orderTable = OrderTableView()
    
    var backArrow: UIButton = {
        let back = UIButton()
        back.setImage(#imageLiteral(resourceName: "arrow_back").withRenderingMode(.alwaysOriginal), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.contentMode = .scaleAspectFill
        back.addTarget(self, action: #selector(backArrowTapped), for: .touchUpInside)
        return back
    }()
    
    var basketText: UILabel = {
        let basket = UILabel()
        basket.text = "Корзина"
        basket.textColor = .black
        basket.font = UIFont(name: "Roboto-Regular", size: 20)
        basket.textAlignment = .left
        basket.translatesAutoresizingMaskIntoConstraints = false
        return basket
    }()
    
    var checkText: UILabel = {
        let check = UILabel()
        check.text = "Выбрано 0 позиций"
        check.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        check.font = UIFont(name: "Roboto-Regular", size: 12)
        check.textAlignment = .left
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    var totalPositionText: UILabel = {
        let position = UILabel()
        position.text = "Итого (3 позиции)"
        position.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        position.font = UIFont(name: "Roboto-Regular", size: 12)
        position.textAlignment = .left
        position.translatesAutoresizingMaskIntoConstraints = false
        return position
    }()
    
    var totalPosition: UILabel = {
        let position = UILabel()
        position.text = "270" + " " + "руб"
        position.textColor = .black
        position.font = UIFont(name: "Roboto-Regular", size: 14)
        position.textAlignment = .left
        position.translatesAutoresizingMaskIntoConstraints = false
        return position
    }()
    
    
    
    var payDeliveryText: UILabel = {
        let delivery = UILabel()
        delivery.text = "Оплата за доставку"
        delivery.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        delivery.font = UIFont(name: "Roboto-Regular", size: 12)
        delivery.textAlignment = .left
        delivery.translatesAutoresizingMaskIntoConstraints = false
        return delivery
    }()
    
    var payDelivery: UILabel = {
        let pay = UILabel()
        pay.text = "350" + " " + "руб"
        pay.textColor = .black
        pay.font = UIFont(name: "Roboto-Regular", size: 14)
        pay.textAlignment = .left
        pay.translatesAutoresizingMaskIntoConstraints = false
        return pay
    }()
    
    var lineView: UIView = {
         let line = UIView()
         line.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1)
         line.translatesAutoresizingMaskIntoConstraints = false
         return line
    }()
    
    var totalText: UILabel = {
        let total = UILabel()
        total.text = "Итого:"
        total.textColor = .black
        total.font = UIFont(name: "Roboto-Regular", size: 20)
        total.textAlignment = .left
        total.translatesAutoresizingMaskIntoConstraints = false
        return total
    }()
    
    var totalPrize: UILabel = {
        let prize = UILabel()
        prize.text = "350" + " " + "руб"
        prize.textColor = .black
        prize.font = UIFont(name: "Roboto-Regular", size: 20)
        prize.textAlignment = .left
        prize.translatesAutoresizingMaskIntoConstraints = false
        return prize
    }()
    
    var orderButton: UIButton = {
        let order = UIButton()
        order.setTitle("Оформить заказ", for: .normal)
        order.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 13)
        order.titleLabel?.textAlignment = .center
        order.titleLabel?.minimumScaleFactor = 0.7
        order.titleLabel?.adjustsFontSizeToFitWidth = true
        order.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        order.setTitleColor(.black, for: .highlighted)
        order.layer.shadowRadius = 3.0
        order.layer.shadowOpacity = 0.3
        order.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        order.addTarget(self, action: #selector(orderButtontapped), for: .touchUpInside)
        order.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        order.layer.cornerRadius = 20
        order.translatesAutoresizingMaskIntoConstraints = false
        return order
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
        
        addSubwiews()
        backArrowConstraints()
        basketTextConstraints()
        checkTextConstraints()
        addOrderTable()
        totalPositionTextConstrints()
        totalPositionConstraints()
        payDeliveryTextConstraints()
        payDeliveryConstraints()
        lineViewConstraints()
        totalTextConstraints()
        totalPrizeConstraints()
        orderButtonConstraints()
        // delete when get data
        orderTable.set(cells: GoodsModel.fetchSushi())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          self.navigationController?.setNavigationBarHidden(true, animated: animated)
      }

      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationController?.setNavigationBarHidden(true, animated: animated)
      }
    
    func addSubwiews() {
        view.addSubview(backArrow)
        view.addSubview(basketText)
        view.addSubview(checkText)
        view.addSubview(orderTable)
        
        view.addSubview(totalPositionText)
        view.addSubview(totalPosition)
        view.addSubview(payDeliveryText)
        view.addSubview(payDelivery)
        view.addSubview(lineView)
        view.addSubview(totalText)
        view.addSubview(totalPrize)
        view.addSubview(orderButton)
    }
    
    func backArrowConstraints() {
        backArrow.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backArrow.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backArrow.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 6).isActive = true
        backArrow.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12).isActive = true
    }
    
    func basketTextConstraints() {
        basketText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        basketText.topAnchor.constraint(equalTo: backArrow.bottomAnchor, constant: 20).isActive = true
    }
    
    func checkTextConstraints() {
        checkText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        checkText.topAnchor.constraint(equalTo: basketText.bottomAnchor, constant: 4).isActive = true
    }
    
    func addOrderTable() {
        orderTable.topAnchor.constraint(equalTo: checkText.bottomAnchor, constant: 16).isActive = true
        orderTable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        orderTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        orderTable.bottomAnchor.constraint(equalTo: totalPositionText.topAnchor, constant: -16).isActive = true
    }
    
    func payDeliveryTextConstraints() {
        payDeliveryText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        payDeliveryText.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -15).isActive = true
        payDeliveryText.firstBaselineAnchor.constraint(equalTo: payDelivery.firstBaselineAnchor).isActive = true
    }
    
    func payDeliveryConstraints() {
        payDelivery.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true
    }

    
    func totalPositionTextConstrints() {
        totalPositionText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        totalPositionText.bottomAnchor.constraint(equalTo: payDeliveryText.topAnchor, constant: -15).isActive = true
        totalPositionText.firstBaselineAnchor.constraint(equalTo: totalPosition.firstBaselineAnchor).isActive = true
    }
    
    func totalPositionConstraints() {
        totalPosition.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true
    }
    
    func lineViewConstraints() {
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.88).isActive = true
        lineView.bottomAnchor.constraint(equalTo: totalPrize.topAnchor, constant: -15).isActive = true
    }
    
    func totalTextConstraints() {
        totalText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        totalText.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -40).isActive = true
        totalText.firstBaselineAnchor.constraint(equalTo: totalPrize.firstBaselineAnchor).isActive = true
    }
    
    func totalPrizeConstraints() {
        totalPrize.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true

    }

    
    func orderButtonConstraints() {
        orderButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        orderButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30).isActive = true
    }
    
    @objc func backArrowTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func orderButtontapped() {
        let registrationVC = RegistrationController()
        navigationController?.pushViewController(registrationVC, animated: true)
    }

}
