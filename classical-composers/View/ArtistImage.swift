//
//  ArtistImage.swift
//  classical-composers
//
//  Created by Aaron Johal on 21/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class ArtistImage: UIImageView {
    
    func updateView(imageURL: String){
    self.loadImageUsingURL(urlString: imageURL)
        makeRounded()

    }
    
    func makeRounded() {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
      }

}
