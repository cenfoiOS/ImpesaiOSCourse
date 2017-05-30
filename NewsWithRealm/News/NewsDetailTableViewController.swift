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
    
    var categoryType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }


    func addSaveNews(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    
    func saveNewsAction(){
        RealmManager.createNews(categoryType: categoryType, title: titleTextField.text!, description: descriptionTextView.text)
        navigationController?.popViewController(animated: true)
    }

    
}
