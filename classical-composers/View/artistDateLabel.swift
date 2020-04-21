//
//  artistDateLabel.swift
//  classical-composers
//
//  Created by Aaron Johal on 21/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class artistDateLabel: UILabel {
    
    
    func updateText(birthday: String, death: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let fullBirthDate = dateFormatter.date(from: birthday)
        let fullDeathDate = dateFormatter.date(from: death)
        
        dateFormatter.dateFormat = "yyyy"
        let startDate = dateFormatter.string(from: fullBirthDate!)
        let deathDate = dateFormatter.string(from: fullDeathDate!)
        
        let date = "(\(startDate) - \(deathDate))"
        
        
    return date
    }

}
