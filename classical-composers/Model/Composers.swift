//
//  Composer.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import Foundation



//https://api.openopus.org/composer/list/epoch/Medieval.json genre endpoint
//https://api.openopus.org/work/list/composer/196/genre/Popular.json composer works endpoint


struct ResponseBody: Decodable {
    var status: Status //status of request
    var composers: [Composers]? //list of composers
    var composer: Composers? //single composer
    var works: [Works]?
    
}

struct Composers: Decodable {
    var id: String
    var name: String
    var completeName: String?
    var imageURL: String
    var genre: String
    var birth: String
    var death: String
    
  
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case completeName = "complete_name"
        case imageURL = "portrait"
        case genre = "epoch"
        case birth = "birth"
        case death = "death"
        
    }
    

}



struct Works: Decodable {
    var title: String
}


struct Status: Decodable {
    var error: String?
    
}





