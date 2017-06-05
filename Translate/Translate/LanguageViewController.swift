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
}

class LanguageViewController: UIViewController {

    @IBOutlet weak var languagesPickerView: UIPickerView!
    weak var delegate: LanguageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  

    @IBAction func languageSelected(_ sender: UIButton) {
        delegate?.closePopover()
    }
}

extension LanguageViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }
}
