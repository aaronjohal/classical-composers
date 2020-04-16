//
//  ComposerRequest.swift
//  classical-composers
//
//  Created by Aaron Johal on 16/04/2020.
//  Copyright © 2020 Aaron Johal. All rights reserved.
//

import Foundation

enum ComposerError: Error {
    case noDataAvailable
    case cantProcessData
    
}

struct ComposerRequest {
   
    let resourceUrl: URL
   
    init(genre: String){
        
      let resourceString = "https://api.openopus.org/composer/list/epoch/\(genre).json"
        
      
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceUrl = resourceURL
        
    }
    
    
     func getComposers(completion: @escaping(Result<[Composers], ComposerError>) -> Void){

        let dataTask = URLSession.shared.dataTask(with: resourceUrl) { (dataReturned, _, _) in
            
           
            guard let dataSuccessfullyReturned = dataReturned else{completion(.failure(.noDataAvailable))
                         return}

                //Where the JSON parsing & deCoding gets executed
                
                //SUCCESFUL Case
                        do {
            
                            let composersResponseSuccess = try JSONDecoder().decode(ResponseBody.self, from: dataSuccessfullyReturned)
                            let composersDetails = composersResponseSuccess.composers
                            completion(.success(composersDetails))
                            print("success")
                        } catch let error{
                            completion(.failure(.cantProcessData))
                            print(error)
                        }
           
        }
        dataTask.resume()
        
    }
}
