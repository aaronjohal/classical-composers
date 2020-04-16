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
    var name: String
    
    enum CodingKeys : String, CodingKey {
        case name = "complete_name"
    }
}

