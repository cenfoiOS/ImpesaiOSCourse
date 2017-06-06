//
//  LanguageViewController.swift
//  Translate
//
//  Created by Cesar Brenes on 6/1/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit

protocol LanguageDelegate: class {
    func closePopover()
    func selectedLanguage(languageType: Constants.LanguageType, languageSelected: String)
}

class LanguageViewController: UIViewController {

    @IBOutlet weak var languagesPickerView: UIPickerView!
    weak var delegate: LanguageDelegate?
    var languageType: Constants.LanguageType?
    var languagesArray = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func languageSelected(_ sender: UIButton) {
        let languageSelect = languagesArray[languagesPickerView.selectedRow(inComponent: 0)]
        delegate?.selectedLanguage(languageType: languageType!, languageSelected: languageSelect[Constants.DIRS_KEY]!)
    }
}

extension LanguageViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row][Constants.LANGUAGE_KEY]
    }
}
