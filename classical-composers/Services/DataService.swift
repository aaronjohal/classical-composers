//
//  DataService.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private let genres =
        [Genre(title: "Medieval"),
         Genre(title: "Renaissance"),
         Genre(title: "Baroque"),
         Genre(title: "Classical"),
         Genre(title: "Early Romantic"),
         Genre(title: "Romantic"),
         Genre(title: "Late Romantic"),
         Genre(title: "20th Century"),
         Genre(title: "Romantic"),
         Genre(title: "Post-War"),
         Genre(title: "21st Century")]
    
    
    func getGenres() -> [Genre] {
        return genres
    }
    
    
    }


