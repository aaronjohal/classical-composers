//
//  PopularWorksRequest.swift
//  classical-composers
//
//  Created by Aaron Johal on 21/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import Foundation

enum WorksError: Error {
    case noDataAvailable
    case cantProcessData
    
}



class PopularWorksRequest {
   let resourceURL: URL
    
    
    init(composerID: String){
        
        let urlString = "https://api.openopus.org/work/list/composer/\(composerID)/genre/all.json"
        guard let resourceURL = URL (string: urlString) else {fatalError()}
        self.resourceURL = resourceURL
        
        print(resourceURL)
    }
    
    
    func getPopularWorks(completion: @escaping (Result <[Works], WorksError>)-> Void){
        
         URLSession.shared.dataTask(with: resourceURL) { (data, _, _) in
            

            guard let dataReturned = data else{completion(.failure(.noDataAvailable))
                return}
         
            
            do {
                let result = try JSONDecoder().decode(ResponseBody.self, from: dataReturned)
                let works = result.works
                
                    completion(.success(works ?? [])) //if works are empty, return empty array
                    
                    print("success")
                
              
            } catch let error{
                completion(.failure(.cantProcessData))
                print(error)
                
            }

            
          
            } .resume()
        
   
        
        
    }
    
    
    
}
