//
//  Composer.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import Foundation

//https://api.openopus.org/composer/list/epoch/Medieval.json

//"status": {
//       "version": "1.20",
//       "success": "true",
//       "source": "db",
//       "rows": 4,
//       "processingtime": 0.0015010833740234375,
//       "api": "Open Opus-cache"
//   },
//   "request": {
////       "type": "epoch",
////       "item": "Medieval"
////   },
////   "composers": ["composers": [
//{
//    "id": "82",
//    "name": "Dufay",
//    "complete_name": "Guillaume Dufay",
//    "birth": "1400-01-01",
//    "death": "1474-01-01",
//    "epoch": "Medieval",
//    "portrait": "https://assets.openopus.org/portraits/40935386-1568084886.jpg"

struct ComposerResponse: Decodable {
    var response: Composers
}

struct Composers: Decodable {
    var composers: [ComposersDetails]
}

struct ComposersDetails: Decodable {
    let id: String
    var name: String

    
}

//"composers": [
//{
//    "id": "82",
//    "name": "Dufay",
//    "complete_name": "Guillaume Dufay",
//    "birth": "1400-01-01",
//    "death": "1474-01-01",
//    "epoch": "Medieval",
//    "portrait": "https://assets.openopus.org/portraits/40935386-1568084886.jpg"
//},

