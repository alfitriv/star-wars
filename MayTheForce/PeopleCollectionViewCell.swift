//
//  PeopleCollectionViewCell.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 16/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func updateData(model: Person) {
        var prettyFormatter = Utils.dateFormatter
        nameLabel.text = model.name
        descriptionLabel.text = model.mass
        var URLString = "https://pixel.nymag.com/imgs/daily/vulture/2016/12/18/18-Star-Wars-Logo.w330.h330.2x.jpg"
        guard let url = URL(string: URLString) else {
            return
        }
        imageView?.kf.setImage(with: url)
    }
    
}
