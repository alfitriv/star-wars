//
//  ViewController.swift
//  MayTheForce
//
//  Created by Vania Radmila Alfitri on 05/01/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var networkLayer = NetworkLayer()
    var people: [Person] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        networkLayer.fetchPeople(successHandler: { [weak self] (starwars) in
            print(starwars)
            guard let strongSelf = self, let results = starwars?.results else {
                return
            }
            strongSelf.people = results
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let peopleCell = tableView.dequeueReusableCell(
            withIdentifier: "peopleCell",
            for: indexPath
            ) as? PeopleCell else {
                fatalError()
        }
        peopleCell.updateData(model: people[indexPath.row])
        return peopleCell
    }
        
}



