//
//  Utils.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 07/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

class Utils {
    
    static var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
