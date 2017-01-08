//
//  PeopleCollectionViewCell.swift
//  Swift-Wing
//
//  Created by Sultan Sultan on 1/6/17.
//  Copyright © 2017 com.elerris. All rights reserved.
//

import Foundation
import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {

// MARK: - Type Properties
static let reuseIdentifier = "PeopleCollectionViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
}
