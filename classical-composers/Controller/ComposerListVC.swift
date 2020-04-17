//
//  ComposerListVC.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import UIKit


class ComposerListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var artistCollectionView: UICollectionView!
    
    private (set) public var genreSelected = ""
    var image = UIImage()
    
    
    var listOfComposers = [Composers]() {
        didSet { //every time new info is added to our array, we want to reload the data in our tableview controller and get the right holidays
            
            DispatchQueue.main.async {
                self.artistCollectionView.reloadData()
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistCollectionView.delegate = self
        artistCollectionView.dataSource = self
        
        getComposers()
        
        let width = (view.frame.size.width - 30) / 2 //get the width of each cell - we want 3 columns, 20 is the spacing in measurement attribute inspector
        let layout = artistCollectionView.collectionViewLayout as! UICollectionViewFlowLayout //get the underlying layout so you can get the item size as UICollectionViewFlowLayout has this property but collectionViewLayout does not
        layout.itemSize = CGSize (width: width, height: width)
        
        
        
    }
    
    func initGenre(genre: Genre){
        genreSelected = genre.title
    }
    
    
    func getComposers() {
        
        let composersRequest =  ComposerRequest.init(genre: self.genreSelected)
        
        composersRequest.getComposers {
            [weak self] composer in switch composer {
            case .success(let composers):
                self?.listOfComposers = composers
                
            case.failure(let error):
                print(error)
            }
        }
        
    }
    
    
    func downloadImages(composer: Composers){
        
        let url = composer.imageURL
        print(url)
        
        guard let imageURL = URL(string: url) else {fatalError()}
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL){
                print(data)
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = image
                        print("image rendering complete")
                        
                        print(self.image)
                    }
                    
                }
                
            }
        }
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfComposers.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = artistCollectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCell", for: indexPath) as? ArtistCell{
            
            let composer = listOfComposers[indexPath.row]
            
            cell.updateView(name: "", image: nil) //necessary to clear any cells
           // downloadImages(composer: composer)
            
            DispatchQueue.global().async {
                let url = composer.imageURL
              guard let imageURL = URL(string: url) else {fatalError()}
                
                let data = try? Data(contentsOf: imageURL)
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.updateView(name: composer.name, image: image)
                    }
                }
            
                
            }
           
            
            return cell
            
        }
        
        
        return ArtistCell()
        
    }
    
}








