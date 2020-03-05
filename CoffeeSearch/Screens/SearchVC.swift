//
//  SearchVC.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 02/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let coffeeSearchTextField = CFTextField()
    let callToACtionButton = CFButton(backgroundColor: .systemPurple, title: "Find a Coffee")
    
    var isCoffeeNameEntered: Bool { return !coffeeSearchTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func createDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushCoffeeListVC() {
        
        guard isCoffeeNameEntered else {
            presentCFAlertOnMainThread(title: "Empty search field ", message: "Please enter something to search 😅", buttonTitle: "OK")
            return
        }
        let coffeeListVC = CoffeeListVC()
        coffeeListVC.coffeeName = coffeeSearchTextField.text
        coffeeListVC.title = coffeeSearchTextField.text
        navigationController?.pushViewController(coffeeListVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "CFlogo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(coffeeSearchTextField)
        coffeeSearchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            coffeeSearchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            coffeeSearchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            coffeeSearchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            coffeeSearchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToACtionButton)
        callToACtionButton.addTarget(self, action: #selector(pushCoffeeListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToACtionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToACtionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToACtionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToACtionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushCoffeeListVC()
        return true
    }
    
}
