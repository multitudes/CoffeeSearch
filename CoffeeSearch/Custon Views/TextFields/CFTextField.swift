//
//  CFTextField.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 02/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CFTextField: UITextField {

    override init(frame:CGRect) {
        super.init(frame: frame)
        configure()
    }
    
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor               = .label
        tintColor               = .label
        textAlignment           = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize         = 12
        
        backgroundColor         = .tertiarySystemBackground
        autocorrectionType      = .no
        autocapitalizationType  = .none
        returnKeyType           = .go
        placeholder             = "Search for something"
    }
    
}
