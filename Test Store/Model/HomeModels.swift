//
//  HomeModels.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import Foundation

struct HomeResponse : Codable {

    var data : Datum?
    var message : String?
    var status : Bool?

    enum CodingKeys: String, CodingKey {
            case data = "data"
            case message = "message"
            case status = "status"
    }
}

struct Datum : Codable {

    var banner : [Banner]?
    var categories : [Category]?
    var offers : [Offer]?
    var products : [Product]?

    enum CodingKeys: String, CodingKey {
            case banner = "banner"
            case categories = "categories"
            case offers = "offers"
            case products = "products"
    }
}

struct Product : Codable {

     var id : Int?
     var image : String?
     var name : String?
     var price : String?
    var discountPrice : String?

     enum CodingKeys: String, CodingKey {
             case id = "id"
             case image = "image"
             case name = "name"
             case price = "price"
     }
}

struct Offer : Codable {

    var discountPrice : String?
    var id : Int?
    var image : String?
    var name : String?
    var price : String?

    enum CodingKeys: String, CodingKey {
            case discountPrice = "discount_price"
            case id = "id"
            case image = "image"
            case name = "name"
            case price = "price"
    }
}

struct Category : Codable {

    var id : Int?
    var name : String?

    enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
    }
}

struct Banner : Codable {

    var id : Int?
    var image : String?

    enum CodingKeys: String, CodingKey {
            case id = "id"
            case image = "image"
    }
}


