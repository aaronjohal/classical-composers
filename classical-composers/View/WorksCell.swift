//
//  WorksCell.swift
//  classical-composers
//
//  Created by Aaron Johal on 21/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class WorksCell: UITableViewCell {
    
    @IBOutlet weak var workTitle: UILabel!
    
    func updateViews(title: String){
        
        self.workTitle.text = title
        
        
    }

}
