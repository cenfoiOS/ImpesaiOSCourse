//
//  DogsViewController.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by Cesar Brenes on 5/16/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    var dogs = [Dog]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDogArray()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIndentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeDogArray(){
        let dog1 = Dog(name: "Dog1", age: "1", color: "Rojo")
        let dog2 = Dog(name: "Dog2", age: "2", color: "Blanco")
        let dog3 = Dog(name: "Dog3", age: "3", color: "Cafe")
        let dog4 = Dog(name: "Dog4", age: "4", color: "Negro")
        let dog5 = Dog(name: "Dog5", age: "5", color: "Blanco")
        dogs = [dog1,dog2,dog3,dog4,dog5]
    }
}



extension DogsViewController: UITableViewDelegate, UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getCellIndentifier())) as! DogTableViewCell
        let dog = dogs[indexPath.row]
        cell.nameLabel.text = dog.name
        cell.ageLabel.text = dog.age
        cell.colorLabel.text = dog.color
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
