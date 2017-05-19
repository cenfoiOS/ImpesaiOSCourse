//
//  CategoryViewController.swift
//  News
//
//  Created by Cesar Brenes on 5/18/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var categories = [Category]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getTableViewCellIdentifier())
        self.title = "Categorías"
    }
    
    
    func initializeCategories(){
        let economyCategory = Category(name: "Economía", image: "economy")
        let sportsCategory = Category(name: "Sports", image: "sports")
        let technologyCategory = Category(name: "Tecnología", image: "technology")
        let incidentCategory = Category(name: "Sucesos", image: "incident")
        categories = [economyCategory,sportsCategory,technologyCategory,incidentCategory]
    }
}


extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getTableViewCellIdentifier()) as! CategoryTableViewCell
        cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
