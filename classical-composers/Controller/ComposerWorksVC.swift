//
//  ComposerWorksVC.swift
//  classical-composers
//
//  Created by Aaron Johal on 20/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class ComposerWorksVC: UIViewController {
    
    
    
    private (set) public var composer: Composers!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initComposer(composer: Composers){
        self.composer = composer
        navigationItem.title = composer.name
    }
  
    


}
