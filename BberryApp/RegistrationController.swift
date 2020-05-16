//
//  RegistrationController.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 07.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//


import UIKit

class RegistrationController: UIViewController {
    
    var backArrow: UIButton = {
        let back = UIButton()
        back.setImage(#imageLiteral(resourceName: "arrow_back").withRenderingMode(.alwaysOriginal), for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.contentMode = .scaleAspectFill
        back.addTarget(self, action: #selector(backArrowTapped), for: .touchUpInside)
        return back
    }()
    
    var registrationLabel: UILabel = {
        let regist = UILabel()
        regist.text = "Регистрация"
        regist.textColor = .black
        regist.font = UIFont(name: "Roboto-Regular", size: 22)
        regist.textAlignment = .left
        regist.translatesAutoresizingMaskIntoConstraints = false
        return regist
    }()
    
    var beerylogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "berrylogo")
        logo.contentMode = .scaleAspectFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    var getPhoneLabel: UILabel = {
        let phone = UILabel()
        phone.text = "Укажите телефон"
        phone.textColor = #colorLiteral(red: 0.9803921569, green: 0.7411764706, blue: 0.09019607843, alpha: 1)
        phone.font = UIFont(name: "Roboto-Regular", size: 12)
        phone.textAlignment = .left
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    
    
    var phoneTextField: UITextField = {
        let phone = UITextField()
        phone.borderStyle = .none
        phone.font = UIFont(name: "Roboto-Regular", size: 22)
        phone.placeholder = "+7"
        phone.keyboardType = .phonePad
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    
    var lineMenuView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.7800580538, green: 0.7800580538, blue: 0.7800580538, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    var termOfUseLabel: UILabel = {
        let term = UILabel()
        term.text = "Нажмите на кнопку “Далее”, вы принимаете условия Пользовательского соглашения"
        term.textColor = #colorLiteral(red: 0.6666666667, green: 0.6705882353, blue: 0.7176470588, alpha: 1)
        term.numberOfLines = 2
        term.font = UIFont(name: "Roboto-Regular", size: 10)
        term.textAlignment = .center
        term.translatesAutoresizingMaskIntoConstraints = false
        return term
    }()

    
    var pickupSelfButton: UIButton = {
        let pickup = UIButton()
        pickup.setTitle("Далее", for: .normal)
        pickup.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        pickup.titleLabel?.textAlignment = .center
        pickup.titleLabel?.minimumScaleFactor = 0.5
        pickup.titleLabel?.adjustsFontSizeToFitWidth = true
        pickup.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        pickup.setTitleColor(.black, for: .highlighted)
        pickup.layer.shadowRadius = 3.0
        pickup.layer.shadowOpacity = 0.3
        pickup.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        pickup.addTarget(self, action: #selector(pickupButtonTapped), for: .touchUpInside)
        pickup.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        pickup.layer.cornerRadius = 20
        pickup.translatesAutoresizingMaskIntoConstraints = false
        return pickup
    }()
    
    var bottomBackground: UIImageView = {
        let bottom = UIImageView()
        bottom.image = UIImage(named: "bottom")
        bottom.contentMode = .scaleAspectFill
        bottom.translatesAutoresizingMaskIntoConstraints = false
        return bottom
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addInSubwies()
        backArrowConstraints()
        registrationLabelConstraints()
        beerylogoConstraints()
        getPhoneLabelConstraints()
        phoneTextFieldConstraints()
        lineMenuViewConstants()
        termOfUseLabelConstraints()
        pickUpButtonConstraints()
        bottomBackgroundConstraints()
        phoneTextField.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    func addInSubwies() {
        view.addSubview(backArrow)
        view.addSubview(registrationLabel)
        view.addSubview(beerylogo)
        view.addSubview(lineMenuView)
        
        view.addSubview(getPhoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(termOfUseLabel)
        view.addSubview(pickupSelfButton)
        view.addSubview(bottomBackground)
    }
    
    func backArrowConstraints() {
        backArrow.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backArrow.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backArrow.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 6).isActive = true
        backArrow.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12).isActive = true
    }
    
    func registrationLabelConstraints() {
        registrationLabel.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 14) .isActive = true
        registrationLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12).isActive = true
    }
    
    func beerylogoConstraints() {
        beerylogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        beerylogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        beerylogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        beerylogo.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 45).isActive = true
    }
    
    func getPhoneLabelConstraints() {
        getPhoneLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12).isActive = true
        getPhoneLabel.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: -4).isActive = true
    }
    
    
    func phoneTextFieldConstraints() {
        
        phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        phoneTextField.bottomAnchor.constraint(equalTo: lineMenuView.topAnchor, constant: 8).isActive = true
    }
    
    func lineMenuViewConstants() {
        
        lineMenuView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineMenuView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineMenuView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84).isActive = true
         lineMenuView.bottomAnchor.constraint(equalTo: termOfUseLabel.topAnchor, constant: -12).isActive = true
    }
    
    
    func termOfUseLabelConstraints() {
        termOfUseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        termOfUseLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        termOfUseLabel.bottomAnchor.constraint(equalTo: pickupSelfButton.topAnchor, constant: -45).isActive = true
    }
    
    
    func pickUpButtonConstraints() {
        pickupSelfButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickupSelfButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pickupSelfButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        pickupSelfButton.bottomAnchor.constraint(equalTo: bottomBackground.topAnchor, constant: -15).isActive = true
    }
    
    func bottomBackgroundConstraints() {
        bottomBackground.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bottomBackground.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        bottomBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func backArrowTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pickupButtonTapped() {
        let adressVC = AdressController()
        navigationController?.pushViewController(adressVC, animated: true)
    }

}

// MARK: Hide KeyBoard

extension RegistrationController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegistrationController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
