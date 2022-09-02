//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by batoul karaki on 01/09/2022.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //Craete a URL Object
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Get a URL session obbject
        
        let session = URLSession.shared
        //Get a data task from the url session object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if there is any errors
            
            if error != nil || data == nil {
                
                return
            }
            
            //parsing the data into video object
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
               let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }catch{
               
            }
            
           
            
        }
        
        //Kick off the task
        dataTask.resume()
        
        
        
    }
}
