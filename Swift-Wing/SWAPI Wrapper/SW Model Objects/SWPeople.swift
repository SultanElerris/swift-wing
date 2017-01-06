//
//  SWPeople.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 12/18/16.
//  Copyright © 2016 com.elerris. All rights reserved.
//

import Foundation

struct SWPeople {
    
    let count: Int?
    let next: AnyObject? // AnyObject because we might get null here
    let previous: AnyObject? // AnyObject because we might get null here
    let results: [SWPerson]
    
    
    init(dictionary: [String: AnyObject]) {
        count = dictionary[PeopleKeys.count] as? Int ?? 0
        next = dictionary[PeopleKeys.next] as AnyObject
        previous = dictionary[PeopleKeys.previous] as AnyObject
        var tempArray: [SWPerson] = []
        if let peopleArray = dictionary[PeopleKeys.results] as? [[String: AnyObject]] {
            
            tempArray = [SWPerson]()
            for person in peopleArray {
                let myPerson = SWPerson(dictionary: person)
                tempArray.append(myPerson)
            }
        }
        results = tempArray
    }
}

private struct PeopleKeys {
    
    static let count = "count"
    static let next = "next"
    static let previous = "previous"
    static let results = "results"
}

