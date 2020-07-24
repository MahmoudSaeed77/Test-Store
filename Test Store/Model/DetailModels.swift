//
//  DetailModels.swift
//  Test Store
//
//  Created by Mohamed Ibrahem on 7/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import Foundation

struct DetailResponse : Codable {

     var data : DetailData?
     var message : String?
     var status : Bool?

     enum CodingKeys: String, CodingKey {
             case data = "data"
             case message = "message"
             case status = "status"
     }
}

struct DetailData : Codable {

    var product : ProductDetail?
    var related : [Related]?

    enum CodingKeys: String, CodingKey {
            case product = "product"
            case related = "related"
    }
}

struct Related : Codable {

    var discountPrice : String?
    var id : Int?
    var image : String?
    var isOffer : Bool?
    var name : String?
    var price : String?

    enum CodingKeys: String, CodingKey {
            case discountPrice = "discount_price"
            case id = "id"
            case image = "image"
            case isOffer = "isOffer"
            case name = "name"
            case price = "price"
    }
}

struct ProductDetail : Codable {

    var bio : String?
    var colors : [Color]?
    var discountPrice : String?
    var id : Int?
    var image : String?
    var imagees : [imagees]?
    var isOffer : Bool?
    var name : String?
    var price : String?
    var rate : Int?

    enum CodingKeys: String, CodingKey {
            case bio = "bio"
            case colors = "colors"
            case discountPrice = "discount_price"
            case id = "id"
            case image = "image"
            case imagees = "images"
            case isOffer = "isOffer"
            case name = "name"
            case price = "price"
            case rate = "rate"
    }
}

struct imagees : Codable {

    var id : Int?
    var image : String?

    enum CodingKeys: String, CodingKey {
            case id = "id"
            case image = "image"
    }
}

struct Color : Codable {

    var id : Int?
    var name : String?

    enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
    }
}


