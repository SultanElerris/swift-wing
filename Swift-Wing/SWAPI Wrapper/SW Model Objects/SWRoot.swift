//
//  SWRoot.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 12/31/16.
//  Copyright © 2016 com.elerris. All rights reserved.
//
// A data model for the root objects (People, Planets, Films, Species, etc..)
import Foundation


struct SWRoot {
    
    let people: String?
    let planets: String?
    let films: String?
    let species: String?
    let vehicles: String?
    let starships: String?
    var array = [String]()

    
    
    init(dictionary: [String: AnyObject]) {
        
        people = dictionary[RootKeys.people] as? String ?? ""
        planets = dictionary[RootKeys.planets] as? String ?? ""
        films = dictionary[RootKeys.films] as? String ?? ""
        species = dictionary[RootKeys.species] as? String ?? ""
        vehicles = dictionary[RootKeys.vehicles] as? String ?? ""
        starships = dictionary[RootKeys.starships] as? String ?? ""
        
        for item in dictionary {
            array.append(item.key)
        }
        
    }
}


private struct RootKeys {
   static let people = "people"
   static let planets = "planets"
   static let films = "films"
   static let species = "species"
   static let vehicles = "vehicles"
   static let starships = "starships"
}



