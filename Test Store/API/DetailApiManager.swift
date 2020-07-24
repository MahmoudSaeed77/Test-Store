//
//  DetailApiManager.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import Foundation
import Alamofire

protocol DetailDelegate {
    func completeDetail(response: DetailResponse)
    func failedDetail(error: String)
}

class DetailApiManager {
    public static let sharedInstance = DetailApiManager()
    let detailUrl = "http://testsore.online/JiV4/api/product/"
    func getDetailResponse(productId: Int, responseDelegate: DetailDelegate?) {
        AF.request(detailUrl+"\(productId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            debugPrint(response)
            
            guard let data = response.data else {return}
            guard let delegate = responseDelegate else {return}
            do {
                let json = try JSONDecoder().decode(DetailResponse.self, from: data)
                delegate.completeDetail(response: json)
            } catch let err {
                delegate.failedDetail(error: err.localizedDescription)
            }
            
        }
    }
}
