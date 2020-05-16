//
//  AdressController.swift
//  BberryApp
//
//  Created by Mairambek on 5/16/20.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

class AdressController: UIViewController {
    
    var backArrow: UIButton = {
        let back = UIButton()
        back.setImage(#imageLiteral(resourceName: "arrow_back").withRenderingMode(.alwaysOriginal), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.contentMode = .scaleAspectFill
        back.addTarget(self, action: #selector(backArrowTapped), for: .touchUpInside)
        return back
    }()
    
    var totalLabel: UILabel = {
        let total = UILabel()
        total.text = "Итого: 397 руб"
        total.textColor = .black
        total.font = UIFont(name: "Roboto-Regular", size: 32)
        total.textAlignment = .center
        total.translatesAutoresizingMaskIntoConstraints = false
        return total
    }()
    
    var deliveryTimeLabel: UILabel = {
        let delivery = UILabel()
        delivery.text = "Время доставки"
        delivery.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        delivery.font = UIFont(name: "Roboto-Regular", size: 12)
        delivery.textAlignment = .left
        delivery.translatesAutoresizingMaskIntoConstraints = false
        return delivery
    }()
    
    
    var timeTextField: UITextField = {
        let phone = UITextField()
        phone.borderStyle = .none
        phone.font = UIFont(name: "Roboto-Regular", size: 22)
        phone.placeholder = "57 минут"
        phone.keyboardType = .default
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    
    var lineMenuView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.7800580538, green: 0.7800580538, blue: 0.7800580538, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    var  adressLabel: UILabel = {
        let adress = UILabel()
        adress.text = "Адрес доставки"
        adress.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        adress.font = UIFont(name: "Roboto-Regular", size: 12)
        adress.textAlignment = .left
        adress.translatesAutoresizingMaskIntoConstraints = false
        return adress
    }()
    
    
    var adressTextField: UITextField = {
        let adress = UITextField()
        adress.borderStyle = .none
        adress.font = UIFont(name: "Roboto-Regular", size: 22)
        adress.placeholder = "Ясный проезд, 11"
        adress.keyboardType = .default
        adress.translatesAutoresizingMaskIntoConstraints = false
        return adress
    }()
    
    var adresslineMenuView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.7800580538, green: 0.7800580538, blue: 0.7800580538, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    var rezervTextLabel: UILabel = {
        let rezerv = UILabel()
        rezerv.text = "Мы резервируем 397 р на вашей карте и спишем после доставки заказа"
        rezerv.numberOfLines = 2
        rezerv.textColor = #colorLiteral(red: 0.5450980392, green: 0.5490196078, blue: 0.6078431373, alpha: 1)
        rezerv.font = UIFont(name: "Roboto-Regular", size: 14)
        rezerv.textAlignment = .center
        rezerv.translatesAutoresizingMaskIntoConstraints = false
        return rezerv
    }()
    
    var goToPayButton: UIButton = {
           let pay = UIButton()
           pay.setTitle("Перейти к оплате", for: .normal)
           pay.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
           pay.titleLabel?.textAlignment = .center
           pay.titleLabel?.minimumScaleFactor = 0.5
           pay.titleLabel?.adjustsFontSizeToFitWidth = true
           pay.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
           pay.setTitleColor(.black, for: .highlighted)
           pay.layer.shadowRadius = 3.0
           pay.layer.shadowOpacity = 0.3
           pay.layer.shadowOffset = CGSize(width: 0, height: 3.0)
           pay.addTarget(self, action: #selector(goToPayButtonTapped), for: .touchUpInside)
           pay.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
           pay.layer.cornerRadius = 20
           pay.translatesAutoresizingMaskIntoConstraints = false
           return pay
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        timeTextField.delegate = self
        adressTextField.delegate = self
        addInSubwiews()
        backArrowConstraints()
        totalLabelConstraints()
        deliveryTimeLabelConstraints()
        timeTextFieldConstraints()
        lineMenuViewConstants()
        adressLabelConstraints()
        adressTextFieldConstraints()
        adresslineMenuViewConstants()
        
        
        rezervTextLabelConstraints()
        goToPayButtonConstraints()
    }
    
    
    func addInSubwiews() {
        view.addSubview(backArrow)
        view.addSubview(totalLabel)
        view.addSubview(deliveryTimeLabel)
        view.addSubview(timeTextField)
        view.addSubview(lineMenuView)
        view.addSubview(adressLabel)
        view.addSubview(adressTextField)
        view.addSubview(adresslineMenuView)
        
        view.addSubview(rezervTextLabel)
        view.addSubview(goToPayButton)
    }
    
    func backArrowConstraints() {
        backArrow.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backArrow.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backArrow.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 6).isActive = true
        backArrow.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
    }
    
    func totalLabelConstraints() {
        totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12).isActive = true
    }
    
    func deliveryTimeLabelConstraints() {
         deliveryTimeLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12).isActive = true
         deliveryTimeLabel.topAnchor.constraint(equalTo: backArrow.bottomAnchor, constant: 24).isActive = true
     }
     
     
     func timeTextFieldConstraints() {
         
         timeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         timeTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
         timeTextField.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
         timeTextField.topAnchor.constraint(equalTo: deliveryTimeLabel.bottomAnchor, constant: 8).isActive = true
     }
     
     func lineMenuViewConstants() {
         
         lineMenuView.heightAnchor.constraint(equalToConstant: 1).isActive = true
         lineMenuView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         lineMenuView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
         lineMenuView.topAnchor.constraint(equalTo: timeTextField.bottomAnchor, constant: -6).isActive = true
     }
    
    func adressLabelConstraints() {
        adressLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12).isActive = true
        adressLabel.topAnchor.constraint(equalTo: lineMenuView.bottomAnchor, constant: 14).isActive = true
    }
    
    
    func adressTextFieldConstraints() {
        
        adressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        adressTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
        adressTextField.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        adressTextField.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    func adresslineMenuViewConstants() {
        
        adresslineMenuView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        adresslineMenuView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        adresslineMenuView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
        adresslineMenuView.topAnchor.constraint(equalTo: adressTextField.bottomAnchor, constant: -6).isActive = true
    }
    
    func rezervTextLabelConstraints() {
        rezervTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rezervTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
        rezervTextLabel.bottomAnchor.constraint(equalTo: goToPayButton.topAnchor, constant: -40).isActive = true
    }
    
    func goToPayButtonConstraints() {
        goToPayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToPayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        goToPayButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        goToPayButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -15).isActive = true
    }
    
    
    @objc func backArrowTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goToPayButtonTapped() {
        print("goToPayButtonTapped")
    }
    


}

// MARK: Hide KeyBoard

extension AdressController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AdressController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
