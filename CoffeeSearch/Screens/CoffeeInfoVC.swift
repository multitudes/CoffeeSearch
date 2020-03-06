//
//  CoffeeInfoVC.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 05/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CoffeeInfoVC: UIViewController {

    let headerView = UIView()
    
    var coffee: Avatar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        add(childVC: CFCoffeeInfoHeaderVC(coffee: coffee ), to: headerView)
        //print(coffee!)
    }

    
    func layoutUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
            
        
        ])
    }

    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
