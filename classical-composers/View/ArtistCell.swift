//
//  ArtistCell.swift
//  classical-composers
//
//  Created by Aaron Johal on 17/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class ArtistCell: UICollectionViewCell {
    
    
    @IBOutlet weak var aristName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func updateView(name: String?, image: UIImage? ){
         aristName.text = name
         imageView.image = image
       
       
    }
    

}
