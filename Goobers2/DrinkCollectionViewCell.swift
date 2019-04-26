//
//  DrinkCollectionViewCell.swift
//  Goobers2
//
//  Created by Jorge Rivero III on 4/26/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit

class DrinkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    static let reuseCellIdentifier = "drink"
    
}
