//
//  CFButton.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 02/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     

    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius       = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font         = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
