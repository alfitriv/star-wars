//
//  ViewController.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 05/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkLayer = NetworkLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkLayer.fetchMovies(successHandler: { [weak self] (starwars) in
            print(starwars)
        }) { (error) in
            print(error)
        }
        //        guard let dataJSONUrl = Bundle.main.url(forResource: "people", withExtension: "json") else {
        //            return
        //        }
        //        print(dataJSONUrl)
        //
        //        guard let starWarsData = try? Data(contentsOf: dataJSONUrl) else {
        //            return
        //        }
        //        print(starWarsData)
        //
        //        let jsonDecoder = JSONDecoder()
        //
        //        do {
        //            let starWars = try jsonDecoder.decode(StarWars.self, from: Data(contentsOf: dataJSONUrl))
        //            print(starWars)
        //        } catch {
        //            print(error.localizedDescription)
        //        }
        //
        //    }
        
        
        
    }
        
    }


