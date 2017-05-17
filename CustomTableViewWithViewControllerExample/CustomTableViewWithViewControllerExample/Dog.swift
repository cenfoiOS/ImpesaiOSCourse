//
//  Dog.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by Cesar Brenes on 5/16/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit

class Dog: NSObject {

    var name: String?
    var age: String?
    var color: String?
    
    
    init(name: String, age: String, color: String) {
        self.name = name
        self.age = age
        self.color = color
    }
    
    
    func prueba(){
    
        let cat = Cat(name: nil, age: "", color: "")
        
    }
}

struct Cat {
    var name: String?
    var age: String
    var color: String
}
