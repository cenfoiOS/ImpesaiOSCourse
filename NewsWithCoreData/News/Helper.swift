//
//  Helper.swift
//  News
//
//  Created by Cesar Brenes on 5/18/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class func getViewControllerIdentifier() -> String{
        return String(describing: self)
    }
}


extension UITableViewCell{
    class func getTableViewCellIdentifier() -> String{
        return String(describing: self)
    }
}

extension UITableView{
    func registerCustomCell(identifier: String){
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
