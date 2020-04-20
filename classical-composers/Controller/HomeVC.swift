//
//  ViewController.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var genreTable: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genreTable.delegate = self
        genreTable.dataSource = self
        genreTable.rowHeight = 100
    
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getGenres().count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = genreTable.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath) as? GenreCell { //identifying the view of the row
            let genre =  DataService.instance.getGenres()[indexPath.row] //get content
            cell.updateViews(title: genre.title)
            return cell
            
        } else {
           return GenreCell()
        }
        
       
       }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = DataService.instance.getGenres()[indexPath.row]
        
        performSegue(withIdentifier: "ComposerListVC", sender: genre)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if let composerListVC = segue.destination as? ComposerListVC {
            
            assert(sender as? Genre != nil)
            composerListVC.initGenre(genre: sender as! Genre)
            
            
        }
    }


}



