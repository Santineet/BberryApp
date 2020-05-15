//
//  GoodsController.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 07.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

private enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

import UIKit

class GoodsController: UIViewController {
    
    private var currentState: State = .closed
    private var leadingConstraint = NSLayoutConstraint()
    private var goodsCollection = GoodsCollectionView()
        
    let opacityView : UIView = {
        let opacity = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        opacity.backgroundColor = .black
        opacity.alpha = 0
        return opacity
    }()
    
    let menuSlideTexture: UIView = {
        let menu = UIView()
        menu.backgroundColor = .white
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    let logoMenu: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "berrylogo")
        logo.contentMode = .scaleAspectFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    var lineMenuView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9725490196, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    var myOrderButton: UIButton = {
        let order = UIButton()
        order.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        order.setTitleColor(.black, for: .normal)
        order.setTitle("  Мои заказы", for: .normal)
        order.titleLabel?.textAlignment = .center
        order.setImage(#imageLiteral(resourceName: "my_orders"), for: .normal)
        order.setBackgroundColor(.white, forState: .normal)
        order.setBackgroundColor(#colorLiteral(red: 0.8657400063, green: 0.8657400063, blue: 0.8657400063, alpha: 1), forState: .highlighted)
        order.addTarget(self, action: #selector(myOrderButtonTapped), for: .touchUpInside)
        order.translatesAutoresizingMaskIntoConstraints = false
        return order
    }()
    
    var userInfoButton: UIButton = {
        let user = UIButton()
        user.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        user.setTitleColor(.black, for: .normal)
        user.setTitle("  Мои данные", for: .normal)
        user.titleLabel?.textAlignment = .center
        user.setImage(#imageLiteral(resourceName: "user_information"), for: .normal)
        user.setBackgroundColor(.white, forState: .normal)
        user.setBackgroundColor(#colorLiteral(red: 0.8657400063, green: 0.8657400063, blue: 0.8657400063, alpha: 1), forState: .highlighted)
        user.addTarget(self, action: #selector(myOrderButtonTapped), for: .touchUpInside)
        user.translatesAutoresizingMaskIntoConstraints = false
        return user
    }()
    
    var aboutServiceButton: UIButton = {
        let service = UIButton()
        service.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        service.setTitleColor(.black, for: .normal)
        service.setTitle("  О сервисе", for: .normal)
        service.titleLabel?.textAlignment = .left
        service.setImage(#imageLiteral(resourceName: "about_service"), for: .normal)
        service.contentEdgeInsets.left = -15
        service.setBackgroundColor(.white, forState: .normal)
        service.setBackgroundColor(#colorLiteral(red: 0.8657400063, green: 0.8657400063, blue: 0.8657400063, alpha: 1), forState: .highlighted)
        service.addTarget(self, action: #selector(myOrderButtonTapped), for: .touchUpInside)
        service.translatesAutoresizingMaskIntoConstraints = false
        return service
    }()
    
    var catalogLabel: UILabel = {
        let catalog = UILabel()
        catalog.text = "Каталог"
        catalog.font = UIFont(name: "Roboto-Regular", size: 22)
        catalog.textColor = .black
        catalog.textAlignment = .left
        catalog.translatesAutoresizingMaskIntoConstraints = false
        return catalog
    }()
    
    var searchControl: UISearchController = {
        let search = UISearchController()
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.image(for: .search, state: .normal)
        search.searchBar.placeholder = "Поиск"
        search.definesPresentationContext = true
        return search
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

     //   searchController.searchResultsUpdater = self
        setupNavigationBar()
        addInSubwies()
        menuSlideTextureConstraine()
        logoMenuConstraints()
        lineMenuViewConstraits()
        myOrderButtonConstraints()
        userInfoButtonConstraints()
        aboutServiceConstraints()
        catalogLabelConstraints()
        goodsCollectionConstraints()
        
        goodsCollection.set(cells: GoodsModel.fetchSushi())
    }
    
    private func addInSubwies() {
       
       view.addSubview(catalogLabel)
       view.addSubview(goodsCollection)
       view.addSubview(opacityView)
       view.addSubview(menuSlideTexture)
       menuSlideTexture.addSubview(logoMenu)
       menuSlideTexture.addSubview(lineMenuView)
       menuSlideTexture.addSubview(myOrderButton)
       menuSlideTexture.addSubview(userInfoButton)
       menuSlideTexture.addSubview(aboutServiceButton)
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "shopping_cart").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(cardButtonTapped))
        
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: view.frame.width / 2, height: 30)
        button.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Магазин за домом", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(titleBarButtonTapped), for: .touchUpInside)
        navigationItem.titleView = button
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          self.navigationController?.setNavigationBarHidden(true, animated: animated)
      }

      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationController?.setNavigationBarHidden(false, animated: animated)
      }
    
    
    func catalogLabelConstraints() {
        catalogLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        catalogLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12).isActive = true
    }
        
    func menuSlideTextureConstraine() {
        menuSlideTexture.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuSlideTexture.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuSlideTexture.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        leadingConstraint = menuSlideTexture.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10)
        leadingConstraint.isActive = true
    }
    
    func logoMenuConstraints() {
        logoMenu.heightAnchor.constraint(equalToConstant: view.frame.height / 6).isActive = true
        logoMenu.widthAnchor.constraint(equalToConstant: view.frame.width / 4).isActive = true
        logoMenu.topAnchor.constraint(equalTo: menuSlideTexture.topAnchor, constant: 85).isActive = true
        logoMenu.centerXAnchor.constraint(equalTo: menuSlideTexture.centerXAnchor, constant: 75).isActive = true
    }
    
    func lineMenuViewConstraits() {
        lineMenuView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        lineMenuView.widthAnchor.constraint(equalTo: menuSlideTexture.widthAnchor).isActive = true
        lineMenuView.topAnchor.constraint(equalTo: logoMenu.bottomAnchor, constant: 15).isActive = true
    }
    
    func myOrderButtonConstraints() {
        myOrderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myOrderButton.widthAnchor.constraint(equalTo: menuSlideTexture.widthAnchor, multiplier: 0.8).isActive = true
        myOrderButton.topAnchor.constraint(equalTo: lineMenuView.bottomAnchor, constant: 10).isActive = true
        myOrderButton.trailingAnchor.constraint(equalTo: menuSlideTexture.trailingAnchor).isActive = true
    }
    
    func userInfoButtonConstraints() {
        userInfoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userInfoButton.widthAnchor.constraint(equalTo: menuSlideTexture.widthAnchor, multiplier: 0.8).isActive = true
        userInfoButton.topAnchor.constraint(equalTo: myOrderButton.bottomAnchor, constant: 4).isActive = true
        userInfoButton.trailingAnchor.constraint(equalTo: menuSlideTexture.trailingAnchor).isActive = true
    }
    
    func aboutServiceConstraints() {
        aboutServiceButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        aboutServiceButton.widthAnchor.constraint(equalTo: menuSlideTexture.widthAnchor, multiplier: 0.8).isActive = true
        aboutServiceButton.topAnchor.constraint(equalTo: userInfoButton.bottomAnchor, constant: 4).isActive = true
        aboutServiceButton.trailingAnchor.constraint(equalTo: menuSlideTexture.trailingAnchor).isActive = true
    }
    
    func goodsCollectionConstraints() {
        goodsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        goodsCollection.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 8).isActive = true
        goodsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        goodsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc func menuButtonTapped(recognizer: UIButton) {
    
         let state = currentState.opposite
         let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
             switch state {
             case .open:
                self.leadingConstraint.constant = self.view.frame.width * 0.6
                self.opacityView.alpha = 0.4
             case .closed:
                 self.leadingConstraint.constant = -10
                 self.opacityView.alpha = 0
             }
             self.view.layoutIfNeeded()
         })
         transitionAnimator.addCompletion { position in
             switch position {
             case .start:
                 self.currentState = state.opposite
             case .end:
                 self.currentState = state
             case .current:
                 ()
             @unknown default:
                 fatalError()
             }
             switch self.currentState {
             case .open:
                self.leadingConstraint.constant = self.view.frame.width * 0.6

             case .closed:
                self.leadingConstraint.constant = -10
             }
         }
         transitionAnimator.startAnimation()
         
     }

    
    @objc func cardButtonTapped() {
        let orderVC = OrderController()
        navigationController?.pushViewController(orderVC, animated: true)
    }
    
    @objc func titleBarButtonTapped() {
        
        let alert = UIAlertController(title: "Изменить тип доставки?", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Да", style: .default) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    @objc func myOrderButtonTapped() {
        print("My orders button tapped")
    
    }

}

extension GoodsController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("")
    }

}

