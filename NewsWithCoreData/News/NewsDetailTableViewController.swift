//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Cesar Brenes on 5/23/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit




class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }


    func addSaveNews(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    
    func saveNewsAction(){
        CoreDataManager.addNews(category: category!, title: titleTextField.text!, descriptionNews: descriptionTextView.text!)
        navigationController?.popViewController(animated: true)
    }

    
}
