//
//  PeopleCell.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 07/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(model: Person) {
        var prettyFormatter = Utils.dateFormatter
        textLabel?.text = model.name
        detailTextLabel?.text = prettyFormatter.string(from: model.created)
    }

}
