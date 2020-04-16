//
//  ComposerListVC.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class ComposerListVC: UIViewController {
    
    private (set) public var genreSelected = ""
    var listOfComposers = [ComposersDetails]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let composersRequest =  ComposerRequest.init(genre: genreSelected)
       
        
        composersRequest.getComposers {
            composer in switch composer {
            case .success(let composers):
                self.listOfComposers = composers
                print("got all the composers")
            case.failure(let error):
                print(error)
            }
        }
    
}
    
    func initGenre(genre: Genre){
          genreSelected = genre.title
          
      }

}