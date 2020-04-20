//
//  Composer.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import Foundation

//https://api.openopus.org/composer/list/epoch/Medieval.json


struct ResponseBody: Decodable {
    var composers: [Composers]
}

struct Composers: Decodable {
    var id: String
    var name: String
    var completeName: String?
    var imageURL: String
    var genre: String
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case completeName = "complete_name"
        case imageURL = "portrait"
        case genre = "epoch"
        
    }
    

}

//
////      "epoch": "Romantic",
//    "birth": "1810-01-01",
//    "death": "1856-01-01",
//    "complete_name": "Robert Schumann",
//    "portrait": "https://assets.openopus.org/portraits/25233320-1568084946.jpg"
//},






