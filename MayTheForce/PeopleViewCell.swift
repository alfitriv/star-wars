//
//  PeopleViewCell.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 14/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit
import Kingfisher

class PeopleViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage?.layer.cornerRadius = 20
        photoImage?.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(model: Person) {
        var prettyFormatter = Utils.dateFormatter
        nameLabel.text = model.name
        heightLabel.text = prettyFormatter.string(from: model.created)
        massLabel.text = model.mass
        var URLString = "https://pixel.nymag.com/imgs/daily/vulture/2016/12/18/18-Star-Wars-Logo.w330.h330.2x.jpg"
        guard let url = URL(string: URLString) else {
            return
        }
        photoImage?.kf.setImage(with: url)
    }
    
}
