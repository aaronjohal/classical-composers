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


class ComposerRequest {
   
    let resourceUrl: URL
    var array = [Composers]()
   
    init(genre: String){
        
    
        let resourceString = "https://api.openopus.org/composer/list/epoch/\(genre).json"
        
        let urlString = resourceString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! //allows empty spaces for adding the %20
        
        guard let resourceURL = URL(string: urlString) else {fatalError()}
        
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

                DispatchQueue.main.async {

                    let composersDetails = composersResponseSuccess.composers
                    completion(.success(composersDetails))
                   print(composersDetails)
                   
                }

            } catch let error{
                completion(.failure(.cantProcessData))
                print(error)
            }

        }
        dataTask.resume()


    }
    

    
    
 }



