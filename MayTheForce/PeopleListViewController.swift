//
//  PeopleListViewController.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 13/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController {
    var peopleData: Person?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let peopleName = peopleData?.name {
            nameLabel?.text = peopleName
        }
        
        if let peopleHeight = peopleData?.height {
            heightLabel?.text = "Height: \(peopleHeight)"
        }

        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
