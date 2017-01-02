//
//  RootViewViewModel.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 1/1/17.
//  Copyright © 2017 com.elerris. All rights reserved.
//

import Foundation
import UIKit



var rootArray = [String]() {
didSet {
    let controller = RootViewController()
    controller.reloadTableData() 
}
    
}

let dataManager = SWAPIDataStore()


struct RootViewViewModel {
    
    func getNumberOfCells() -> Int {
        return rootArray.count
    }
    
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func fetchDataForRoot() {
        SWAPIDataStore.sharedInstance.getDataForRoot(serviceURL: "https://swapi.co/api/people/?format=json", completion: { (request, response) -> Void in
            
            if let array = request?.array{
                rootArray = array
                
            }
        })
    }
    
    func getTitleForCell(atIndex:Int) -> String {
        return rootArray[atIndex]
        
    }
}
