//
//  DetailViewModel.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import Foundation

class DetailViewModel: DetailDelegate {
    func completeDetail(response: DetailResponse) {
        self.view.detailResponseData = response
        self.view.assignToUI(response: response)
        self.view.imgCollectionView.reloadData()
        self.view.colerCollectionView.reloadData()
        self.view.anotherDealsCollectionView.reloadData()
    }
    
    func failedDetail(error: String) {
        
    }
    
    
    private weak var view: DetailsViewController!
    
    init(view: DetailsViewController) {
        self.view = view
        DetailApiManager.sharedInstance.getDetailResponse(productId: self.view.productId, responseDelegate: self)
    }
}
