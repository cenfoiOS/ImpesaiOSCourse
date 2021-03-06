//
//  ViewController.swift
//  Translate
//
//  Created by Cesar Brenes on 5/30/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController,NVActivityIndicatorViewable {

    @IBOutlet weak var originLanguageTextView: UITextView!
    @IBOutlet weak var destinationLanguageTextView: UITextView!
    @IBOutlet weak var originLanguageLabel: UILabel!
    @IBOutlet weak var destinationLanguageLabel: UILabel!
    
    
    var languagesArray: [[String:String]]?
    var originLanguage: String?
    var destinationLanguage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        registerNotifications()
        APIManager.getLanguages()
    }
    
    func registerNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(getLanguagesAvailable(notification:)), name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(errorFound), name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    func getLanguagesAvailable(notification: Notification){
        languagesArray = notification.userInfo![Constants.LANGUAGE_KEY] as? [[String:String]]
        hideActivityIndicator()
    }
    
    func errorFound(){
        hideActivityIndicator()
        let alertController = UIAlertController(title: "Error found", message: "We found an error trying to download the languages, please try later", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.pacman)
        }
    }
    
    func hideActivityIndicator(){
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
   
    @IBAction func originLanguageAction(_ sender: Any) {
       presentLanguageController(languageType: Constants.LanguageType.origin)
    }

    @IBAction func destinationLanguageAction(_ sender: Any) {
       presentLanguageController(languageType: Constants.LanguageType.destination)
    }
    
    @IBAction func changeLanguagesAction(_ sender: Any) {
        let backup = originLanguage
        originLanguage = destinationLanguage
        destinationLanguage = backup
        updateLanguagesLabels()
    }
    
    @IBAction func translateAction(_ sender: Any) {
        view.endEditing(true)
        showActivityIndicator()
        APIManager.createTranslate(originalLanguage: originLanguage!, destinationLanguage: destinationLanguage!, textToTranslate: originLanguageTextView.text) { (textTranslated) in
            self.hideActivityIndicator()
            self.destinationLanguageTextView.text = textTranslated!
        }
    }
    func presentLanguageController(languageType: Constants.LanguageType){
        let languageViewController = storyboard?.instantiateViewController(withIdentifier: "LanguageViewController") as! LanguageViewController
        languageViewController.modalPresentationStyle = .overCurrentContext
        languageViewController.delegate = self
        languageViewController.languageType = languageType
        languageViewController.languagesArray = languagesArray!
        present(languageViewController, animated: true, completion: nil)
    }
    
    func updateLanguagesLabels(){
        originLanguageLabel.text = originLanguage?.uppercased()
        destinationLanguageLabel.text = destinationLanguage?.uppercased()
    }
    
}

extension ViewController: LanguageDelegate{
    func closePopover() {
        dismiss(animated: true, completion: nil)
    }
    
    func selectedLanguage(languageType: Constants.LanguageType, languageSelected: String) {
        closePopover()
        switch languageType {
        case .origin:
            originLanguage = languageSelected
            break
        case .destination:
            destinationLanguage = languageSelected
            break
        }
        updateLanguagesLabels()
    }
}

