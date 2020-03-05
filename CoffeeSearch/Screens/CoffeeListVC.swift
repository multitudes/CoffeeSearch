//
//  CoffeeListVC.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 02/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import UIKit

class CoffeeListVC: UIViewController {
    
    enum Section { case main }
    
    var coffeeName: String!
    var avatars: [Avatar] = []
    var filteredAvatars: [Avatar] = []
    var page = 1
    var hasMoreCoffee = true
    var isSearching = false
    
    var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, Avatar>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getCoffee()
        configureDataSource()
        configureSearchController()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
        
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CoffeeCell.self, forCellWithReuseIdentifier: CoffeeCell.reuseID)
        
    }
    
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func getCoffee() {
        
        showLoadingView()
        NetworkManager.shared.getCoffee(for: coffeeName) { [weak self] result in
            guard let self = self else { return }
            #warning ("call dismiss")
            self.dismissLoadingView()
            
            switch result {
                case .success(let avatars):
                    if avatars.count < 100 { self.hasMoreCoffee = false }
                    self.avatars = avatars
                    if self.avatars.isEmpty {
                        let message = "No Coffee Here! 😦 "
                        DispatchQueue.main.async {
                            self.showEmptyStateView(with: message, in: self.view)
                            return
                        }
                    }

                    self.updateData(on: avatars)
                    print(avatars)
                        
                case .failure(let error):
                    self.presentCFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    
    func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Avatar>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, avatar) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeCell.reuseID, for: indexPath) as! CoffeeCell
            cell.set(avatar: avatar)
            
            return cell
        })
    }
    
    
    func updateData(on avatars: [Avatar]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Avatar>()
        snapshot.appendSections([.main])
        snapshot.appendItems(avatars)
        DispatchQueue.main.async {
            self.datasource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension CoffeeListVC: UICollectionViewDelegate {
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY             = scrollView.contentOffset.y
        let contentHeight       = scrollView.contentSize.height
        let height              = scrollView.frame.size.height
        let boundsHeight              = scrollView.bounds.height
        print("OffsetY : \(offsetY)")
        print("contentHeight : \(contentHeight)")
        print("height : \(height)")
        print("boundsHeight : \(boundsHeight)")
        
        if offsetY > contentHeight - height {
            guard hasMoreCoffee == true else { return }
            print("get next page with the func getcoffee( name page +1 )")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredAvatars : avatars
        let coffee = activeArray[indexPath.item]
        
        let destVC = CoffeeInfoVC()
        destVC.coffee   = coffee
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
    
}


extension CoffeeListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        filteredAvatars = avatars.filter { $0.coffeeName.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredAvatars)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: avatars)
    }
    
}
