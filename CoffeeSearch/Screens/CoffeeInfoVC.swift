//
//  CoffeeInfoVC.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 05/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CoffeeInfoVC: UIViewController {

    var coffee: Avatar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        print(coffee!)
    }
    

    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
