//
//  LogoController.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 27.04.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit


class LogoController: UIViewController {
    
    
    var beerylogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "berrylogo")
        logo.contentMode = .scaleAspectFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    var text18year: UILabel = {
        var year = UILabel()
        year.text = "Вам уже исполнилось 18 лет?"
        year.font = UIFont(name: "Roboto-Regular", size: 18)
        year.textAlignment = .center
        year.textColor = .black
        year.translatesAutoresizingMaskIntoConstraints = false
        return year
    }()
    
    var textNoButtonTapped: UILabel = {
        var textAttention = UILabel()
        textAttention.text = "Мы заботимся о здоровье молодого поколения, поэтому не продаем алкоголь лицам младше 18 лет."
        textAttention.font = UIFont(name: "Roboto-Regular", size: 16)
        textAttention.numberOfLines = 0
        textAttention.textAlignment = .center
        textAttention.textColor = .black
        textAttention.translatesAutoresizingMaskIntoConstraints = false
        return textAttention
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.fill
        stack.spacing = 35
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var yesButton: UIButton = {
        let yes = UIButton()
        yes.setTitle("Да", for: .normal)
        yes.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        yes.titleLabel?.textAlignment = .center
        yes.titleLabel?.minimumScaleFactor = 0.5
        yes.titleLabel?.adjustsFontSizeToFitWidth = true
        yes.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        yes.setTitleColor(.black, for: .highlighted)
        yes.layer.shadowRadius = 3.0
        yes.layer.shadowOpacity = 0.3
        yes.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        yes.addTarget(self, action: #selector(yesButtontapped), for: .touchUpInside)
        yes.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        yes.layer.cornerRadius = 20
        yes.translatesAutoresizingMaskIntoConstraints = false
        return yes
    }()
    
    var noButton: UIButton = {
        let noButton = UIButton()
        noButton.setTitle("Нет", for: .normal)
        noButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        noButton.titleLabel?.textAlignment = .center
        noButton.titleLabel?.minimumScaleFactor = 0.5
        noButton.titleLabel?.adjustsFontSizeToFitWidth = true
        noButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        noButton.setTitleColor(.black, for: .highlighted)
        noButton.layer.shadowRadius = 3.0
        noButton.layer.shadowOpacity = 0.3
        noButton.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        noButton.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
        noButton.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        noButton.layer.cornerRadius = 20
        noButton.translatesAutoresizingMaskIntoConstraints = false
        return noButton
    }()
    
    var backButton: UIButton = {
        let back = UIButton()
        back.setTitle("Назад", for: .normal)
        back.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        back.titleLabel?.textAlignment = .center
        back.titleLabel?.minimumScaleFactor = 0.5
        back.titleLabel?.adjustsFontSizeToFitWidth = true
        back.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        back.setTitleColor(.black, for: .highlighted)
        back.layer.shadowRadius = 3.0
        back.layer.shadowOpacity = 0.3
        back.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        back.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        back.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        back.layer.cornerRadius = 20
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
    
    var deliveryButton: UIButton = {
        let delivery = UIButton()
        delivery.setTitle("Доставка", for: .normal)
        delivery.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        delivery.titleLabel?.textAlignment = .center
        delivery.titleLabel?.minimumScaleFactor = 0.5
        delivery.titleLabel?.adjustsFontSizeToFitWidth = true
        delivery.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        delivery.setTitleColor(.black, for: .highlighted)
        delivery.layer.shadowRadius = 3.0
        delivery.layer.shadowOpacity = 0.3
        delivery.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        delivery.addTarget(self, action: #selector(deliveryButtonTapped), for: .touchUpInside)
        delivery.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        delivery.layer.cornerRadius = 20
        delivery.translatesAutoresizingMaskIntoConstraints = false
        return delivery
    }()
    
    var pickupSelfButton: UIButton = {
        let pickup = UIButton()
        pickup.setTitle("Самовывоз", for: .normal)
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
    
    let deliveryStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.alignment = UIStackView.Alignment.fill
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        appSettings()
        addInSubwiew()
        berryLogoConstraints()
        text18yearConstraints()
        buttonStackConstrains()
        yesButtonConstraints()
        noButtonConstraints()
        bottomBackgroundConstraints()
        textNoButtonTappedConstraints()
        backButtonTappedConstraints()
        deliveryButtonTappedConstraints()
        pickUpButtonConstraints()
        deliveryStackConstrains()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func addInSubwiew() {
        view.addSubview(beerylogo)
        view.addSubview(text18year)
        
        buttonStack.addArrangedSubview(yesButton)
        buttonStack.addArrangedSubview(noButton)
        view.addSubview(buttonStack)
        
        view.addSubview(bottomBackground)
        view.addSubview(textNoButtonTapped)
        view.addSubview(backButton)
        
        deliveryStack.addArrangedSubview(deliveryButton)
        deliveryStack.addArrangedSubview(pickupSelfButton)
        view.addSubview(deliveryStack)
    }
    
    func appSettings() {
        view.backgroundColor = .white
        textNoButtonTapped.isHidden = true
        backButton.isHidden = true
        deliveryButton.isHidden = true
        pickupSelfButton.isHidden = true
    }
    
    
    func berryLogoConstraints() {
        beerylogo.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        beerylogo.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    }
    
    func text18yearConstraints() {
        
        text18year.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text18year.topAnchor.constraint(equalTo: beerylogo.bottomAnchor, constant: 20).isActive = true
    }
    
    func yesButtonConstraints() {
        yesButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        yesButton.widthAnchor.constraint(equalToConstant: 105).isActive = true
    }
    
    func noButtonConstraints() {
        noButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        noButton.widthAnchor.constraint(equalToConstant: 105).isActive = true
    }
    
    func buttonStackConstrains() {
        buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: bottomBackground.topAnchor, constant: -40).isActive = true
    }
    
    func bottomBackgroundConstraints() {
        bottomBackground.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bottomBackground.heightAnchor.constraint(equalToConstant: 200).isActive = true
        bottomBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func textNoButtonTappedConstraints() {
        textNoButtonTapped.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textNoButtonTapped.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        textNoButtonTapped.topAnchor.constraint(equalTo: beerylogo.bottomAnchor, constant: 20).isActive = true
    }
    
    func backButtonTappedConstraints() {
        backButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: bottomBackground.topAnchor, constant: -15).isActive = true
    }
    
    func deliveryButtonTappedConstraints() {
        deliveryButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        deliveryButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
    }
    
    func pickUpButtonConstraints() {
        pickupSelfButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        pickupSelfButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
    }
    
    func deliveryStackConstrains() {
        deliveryStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deliveryStack.bottomAnchor.constraint(equalTo: bottomBackground.topAnchor, constant: -20).isActive = true
    }
    
    
    @objc func yesButtontapped() {
        text18year.isHidden = true
        buttonStack.isHidden = true
        deliveryButton.isHidden = false
        pickupSelfButton.isHidden = false
    }
    
    @objc func noButtonTapped() {
        text18year.isHidden = true
        buttonStack.isHidden = true
        textNoButtonTapped.isHidden = false
        backButton.isHidden = false
    }
    
    @objc func backButtonTapped() {
        textNoButtonTapped.isHidden = true
        backButton.isHidden = true
        text18year.isHidden = false
        buttonStack.isHidden = false
    }
    
    
    
    @objc func deliveryButtonTapped() {
        let mapVC = MapController()
        navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @objc func pickupButtonTapped() {
        let mapVC = MapController()
        navigationController?.pushViewController(mapVC, animated: true)
    }
    
}

