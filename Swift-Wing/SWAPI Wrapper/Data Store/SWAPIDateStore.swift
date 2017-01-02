//
//  SWAPIDateStore.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 12/18/16.
//  Copyright © 2016 com.elerris. All rights reserved.
//

import Foundation
import Alamofire

struct SWAPIDataStore {
    
    static let sharedInstance = SWAPIDataStore()
    
    
    
    // Method to fetch root response and return a root object back to the caller
    func getDataForRoot(serviceURL: String, completion: @escaping ((SWRoot?, Bool) -> Void)) {
        
        Alamofire.request("https://swapi.co/api/").responseJSON { response in
            
            if let JSON = response.result.value {
                let rootObject = SWRoot.init(dictionary: JSON as! [String : AnyObject])
                completion(rootObject, true)
            }else {
                completion(nil, false)
            }
        }
    }
    
    // Method to fetch people response and return a people object back to the caller
    
    func getDataForPeople(serviceURL: String, completion: @escaping ((SWPeople?, Bool) -> Void)) {

        Alamofire.request("https://swapi.co/api/people/?format=json").responseJSON { response in
            
            if let JSON = response.result.value {
            let peopleObject = SWPeople.init(dictionary: JSON as! [String : AnyObject])
                completion(peopleObject, true)
            }else {
                completion(nil, false)
            }
        }
    }
    

    
    // Method to fetch people response and return a plants model back to the user
    func getDataForPlants() {
        Alamofire.request("https://swapi.co/api/people/?format=json").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let people = SWPeople.init(dictionary: JSON as! [String : AnyObject])
                
                print(people.count)
            }
        }
    }
    
    
}
