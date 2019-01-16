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
    
    let cellHeight: CGFloat = 200

    
    var imageViewBackground: UIImageView!

    override func viewDidLoad() {
        tableView.backgroundColor = .black
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .clear
        addBackground()
        tableView.register(UINib(nibName: "PeopleViewCell", bundle: nil), forCellReuseIdentifier: "PeopleViewCell")
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
            withIdentifier: "PeopleViewCell",
            for: indexPath
            ) as? PeopleViewCell else {
                fatalError()
        }
        peopleCell.updateData(model: people[indexPath.row])
        return peopleCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peopleData = people[indexPath.row]
        let peopleListVC = PeopleListViewController.init(nibName: "PeopleListViewController", bundle: nil)
        
        peopleListVC.peopleData = peopleData
        navigationController?.pushViewController(peopleListVC, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = tableView.indexPathForSelectedRow
//        let index = people[indexPath!.row]
//        let detailViewController = segue.destination as! PeopleListViewController
//        detailViewController.peopleData = index
//    }
    
    
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: 100))
        imageViewBackground.image = UIImage(named: "starwars_posters")
        
        //change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.top
        imageViewBackground.clipsToBounds = false
        
        tableView.backgroundView = imageViewBackground
        //tableView.sendSubviewToBack(imageViewBackground)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(tableView.contentOffset.y)
        
        let topInset = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        let navHeight = navigationController?.navigationBar.frame.height ?? 0
        let contentOffsetY = scrollView.contentOffset.y + navHeight + topInset + cellHeight
        
        let alpha = contentOffsetY / cellHeight
        imageViewBackground?.alpha = 1 - alpha + 0.2
        print(alpha)
        
        let scale = cellHeight + contentOffsetY
        imageViewBackground?.transform = CGAffineTransform(scaleX: scale / cellHeight, y: scale / cellHeight)
        
    }
        
}




