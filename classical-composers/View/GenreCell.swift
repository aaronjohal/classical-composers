//
//  GenreCell.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class GenreCell: UITableViewCell {
    
    @IBOutlet weak var genreTitle: UILabel!
    
    func updateViews(title:String){
         genreTitle.text = title
        
    }

 

}
