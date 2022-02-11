//
//  PLWHomeModel.swift
//  TravelApp
//
//  Created by 塔肯 on 2022/2/10.
//

import UIKit

struct Menus: Codable {
    var code: Int
    var data: [Datum]
    var message: String
}
struct Datum: Codable {
    
    var id: Int?
    var name: String?
    var iconUrl: String?
    var url: String?
    var skinSupport: Bool?
    var homepageModel: String?
//    
//    enum CodingKeys: String,CodingKey {
//        case id,name
//        case iconUrl
//        case url,skinSupport,homepageModel
//
//    }
    
    
}
