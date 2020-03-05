//
//  CoffeeCell.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 03/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CoffeeCell: UICollectionViewCell {
    
    static let reuseID = "CoffeeCell"
    
    let avatarImageView = CFAvatarImageView(frame: .zero)
    let avatarNameLabel = CFTitleLabel(textAlignment: .center, fontSize: 12)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(avatar: Avatar) {
        avatarNameLabel.text = avatar.coffeeName
        avatarImageView.downloadImage(from: avatar.imageSmall)
        
    }
    
    
    func configure() {
        addSubview(avatarImageView)
        addSubview(avatarNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            avatarNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            avatarNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarNameLabel.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        
    }
    
}
