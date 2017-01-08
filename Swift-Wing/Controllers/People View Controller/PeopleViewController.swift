//
//  PeopleViewController.swift
//  Swift-Wing
//
//  Created by Sultan R. Sultan on 1/1/17.
//  Copyright © 2017 com.elerris. All rights reserved.
//

import Foundation
import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var peopleArray = [SWPerson]()
    var pageNumber: Int = 1
 
    override func viewDidLoad() {
        
        self.collectionView?.register(UINib(nibName: PeopleCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PeopleCollectionViewCell.reuseIdentifier)
        
        fetchDataforPeople(pageNumbe: pageNumber)
    
    }
    
    func fetchDataforPeople(pageNumbe:Int) {
        SWAPIDataStore.sharedInstance.getDataForPeople(serviceURL: "https://swapi.co/api/people/?page=\(pageNumber)", completion: { (request, response) -> Void in
            
            
            if response {
                self.peopleArray = self.peopleArray + (request?.results)!
                self.collectionView.reloadData()
            }
            
            
        })
    }
    
}


extension PeopleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.peopleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.reuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
        cell.nameLabel.text = peopleArray[indexPath.row].name
        
        
        if indexPath.row == self.peopleArray.count - 1 { // last cell
            pageNumber = pageNumber + 1
            fetchDataforPeople(pageNumbe: pageNumber) // increment `fromIndex` by 20 before server call
            
        }
        
        return cell
    }
}

extension PeopleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: view.bounds.width, height: 120);
    }
}
