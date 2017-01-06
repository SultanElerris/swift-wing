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
    
    override func viewDidLoad() {
        
        self.collectionView?.register(UINib(nibName: PeopleCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PeopleCollectionViewCell.reuseIdentifier)
    }
    
}


extension PeopleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.reuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
        cell.nameLabel.text = "test"
        return cell
    }
}
