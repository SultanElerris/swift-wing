//
//  SWPerson.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 12/18/16.
//  Copyright © 2016 com.elerris. All rights reserved.
//

import Foundation

struct SWPerson {
    
    let name: String?
    let height: String?
    let mass: String?
    let hairColor: String?
    let skinColor: String?
    let eyeColor:String?
    let birthYear: String?
    let gender: String?
    let homeworld: String?
    let films: [String]?
    let species: [String]?
    let vehicles: [String]?
    let starShip: [String]?
    let created: Date?
    let edited: Date?
    let url: String?
    
    init(dictionary: [String: AnyObject]) {
        name = dictionary[PersonKeys.name] as? String ?? ""
        height = dictionary[PersonKeys.height] as? String ?? ""
        mass = dictionary[PersonKeys.mass] as? String ?? ""
        hairColor = dictionary[PersonKeys.hairColor] as? String ?? ""
        skinColor = dictionary[PersonKeys.skinColor] as? String ?? ""
        eyeColor = dictionary[PersonKeys.eyeColor] as? String ?? ""
        birthYear = dictionary[PersonKeys.birthYear] as? String ?? ""
        gender = dictionary[PersonKeys.gender] as? String ?? ""
        homeworld = dictionary[PersonKeys.homeworld] as? String ?? ""
        created = dictionary[PersonKeys.created] as? Date
        edited = dictionary[PersonKeys.edited] as? Date
        url = dictionary[PersonKeys.url] as? String ?? ""
        films = dictionary[PersonKeys.films] as? [String] ?? [""]
        species = dictionary[PersonKeys.species] as? [String] ?? [""]
        vehicles = dictionary[PersonKeys.vehicles] as? [String] ?? [""]
        starShip = dictionary[PersonKeys.starships] as? [String] ?? [""]
    }
    
}

private struct PersonKeys {
    static let name = "name"
    static let height = "height"
    static let mass = "mass"
    static let hairColor = "hair_color"
    static let skinColor = "skin_color"
    static let eyeColor = "eye_color"
    static let birthYear = "birth_year"
    static let gender = "gender"
    static let homeworld = "homeworld"
    static let films = "films"
    static let species = "species"
    static let vehicles = "vehicles"
    static let starships = "starships"
    static let created = "created"
    static let edited = "edited"
    static let url = "url"
}
