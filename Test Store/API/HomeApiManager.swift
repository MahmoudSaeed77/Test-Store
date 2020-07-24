//
//  HomeApiManager.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeDelegate {
    func completeHome(response: HomeResponse)
    func failedHome(error: String)
}

class HomeApiManager {
    public static let sharedInstance = HomeApiManager()
    let homeUrl = "http://testsore.online/JiV4/api/home"
    func getHomeResponse(responseDelegate: HomeDelegate?) {
        AF.request(homeUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            debugPrint(response)
            
            guard let data = response.data else {return}
            guard let delegate = responseDelegate else {return}
            do {
                let json = try JSONDecoder().decode(HomeResponse.self, from: data)
                delegate.completeHome(response: json)
            } catch let err {
                delegate.failedHome(error: err.localizedDescription)
            }
            
        }
    }
    
}
