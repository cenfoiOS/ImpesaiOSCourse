//
//  APIManager.swift
//  Translate
//
//  Created by Cesar Brenes on 6/1/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    
    class func getLanguages(){
        Alamofire.request("\(Constants.API_URL)languages", method: .get, parameters: nil, encoding: URLEncoding.default, headers: [Constants.API_HEADER_KEY: Constants.API_KEY]).responseJSON { (response) in
            switch response.result{
            case .success:
                if let dictionary = response.result.value as? [String: AnyObject]{
                    createLanguagesAvailableAnswer(dictionary: dictionary[Constants.LANGUAGE_KEY] as! [String: AnyObject])
                }
                break
            case .failure(let error):
                print("ERROR \(error)")
                sendErrorNotification()
                break
            }
        }
    }
    

    class func createLanguagesAvailableAnswer(dictionary: [String: AnyObject]){
        var languagesArray = [[String: String]]()
        for (key, value) in dictionary{
            if let value = value as? String{
                let dictionaryWithNewFormat = [Constants.DIRS_KEY: key, Constants.LANGUAGE_KEY: value]
                languagesArray.append(dictionaryWithNewFormat)
            }
            else{
                sendErrorNotification()
                return
            }
        }
        let result = [Constants.LANGUAGE_KEY: languagesArray]
        NotificationCenter.default.post(name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil, userInfo: result)
    }
    
    class func sendErrorNotification(){
        NotificationCenter.default.post(name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
}
