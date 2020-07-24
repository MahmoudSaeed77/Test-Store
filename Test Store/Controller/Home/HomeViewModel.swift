//
//  HomeViewModel.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import Foundation

class HomeViewModel: HomeDelegate {
    func completeHome(response: HomeResponse) {
        self.view.homeResponseData = response
        self.view.AssignToUI(response: response)
        self.view.bestCollectionView.reloadData()
        self.view.updatedCollectionView.reloadData()
        self.view.bannerCollectionView.reloadData()
        self.view.catCollectionView.reloadData()
    }
    
    func failedHome(error: String) {
        
    }
    
    
    private weak var view: ViewController!
    
    init(view: ViewController) {
        self.view = view
        HomeApiManager.sharedInstance.getHomeResponse(responseDelegate: self)
    }
}
