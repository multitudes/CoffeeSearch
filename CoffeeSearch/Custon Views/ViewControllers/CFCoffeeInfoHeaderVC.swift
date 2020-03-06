//
//  CFCoffeeInfoHeaderVC.swift
//  CoffeeSearch
//
//  Created by Laurent B on 06/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CFCoffeeInfoHeaderVC: UIViewController {

    let avatarImageView = CFAvatarImageView(frame: .zero)
    let coffeeNameLabel = CFTitleLabel(textAlignment: .left, fontSize: 34)
    let categoryLabel = CFSecondaryLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = CFSecondaryLabel(fontSize: 18)
    let bioLabel = CFBodyLabel(textAlignment: .left)
    
    var coffee: Avatar!
    
    init(coffee: Avatar) {
        super.init(nibName: nil, bundle: nil)
        self.coffee = coffee
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: coffee.imageSmall)
        coffeeNameLabel.text = coffee.coffeeName
        categoryLabel.text = coffee.category ?? ""
        locationLabel.text = coffee.region ?? ""
        bioLabel.text = coffee.preparation ?? ""
        
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        
    }
    
    
    func layoutUI() {
        
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            coffeeNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            coffeeNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            coffeeNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            coffeeNameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            categoryLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            categoryLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
    
    func addSubview() {
        view.addSubview(avatarImageView)
        view.addSubview(coffeeNameLabel)
        view.addSubview(categoryLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        
    }
    
   
}
