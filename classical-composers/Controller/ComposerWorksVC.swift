//
//  ComposerWorksVC.swift
//  classical-composers
//
//  Created by Aaron Johal on 20/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class ComposerWorksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    

    var worksList = [Works]() {
        didSet {
            DispatchQueue.main.async {
                self.worksTable.reloadData()
            }
        }
    }
    
    
    
    
    @IBOutlet weak var artistImage: ArtistImage!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var dobLabel: artistDateLabel!
    @IBOutlet weak var worksTable: UITableView!
    
    
    var hasWorks = true
    
    
    private (set) public var composer: Composers!

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("the id used for the api endpoint is: \( composer.id)")
        updateLayout()
        getWorks()
        
        worksTable.delegate = self
        worksTable.dataSource = self
        
        

    }
    
    func initComposer(composer: Composers){
        self.composer = composer
        navigationItem.title = composer.name
    }
    
    func getWorks(){
        let worksRequest = PopularWorksRequest.init(composerID: composer.id)
        worksRequest.getPopularWorks {
            work in switch work {
            case .success(let work):
                
                self.worksList = work
                print(work)
               
                if self.worksList.isEmpty {
                    self.hasWorks = false
                    print("no work to display")
                } 
                
        case .failure(let error):
            print(error)
            }
            
        }
    }
    
    func updateLayout(){
        artistImage.updateView(imageURL: composer.imageURL)
        artistName.text = composer.completeName
        
      let date = dobLabel.updateText(birthday: composer.birth, death: composer.death)
        dobLabel.text = date
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worksList.count
       }
    
    
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorksCell", for: indexPath) as? WorksCell {
            
            let work = worksList[indexPath.row]
            cell.updateViews(title: work.title)
    
            return cell
            
        }
        
        return WorksCell ()
       }
  

}
