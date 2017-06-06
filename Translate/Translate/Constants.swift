//
//  Constants.swift
//  Translate
//
//  Created by Cesar Brenes on 6/1/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.

//

import Foundation


struct Constants{
    static let API_KEY = "NXrPcrRP7ImshGC3WtYKTWhgLT6Hp1ITgE0jsncYik9Kxxjjhm"
    static let API_URL = "https://gybra-trans-lator.p.mashape.com/"
    static let DIRS_KEY = "dirs"
    static let LANGUAGE_KEY = "langs"
    static let LANGUAGES_ARRAY_KEY = "LANGUAGES_ARRAY_KEY"
    static let GET_LANGUAGES_NOTIFICATION = "GET_LANGUAGES_NOTIFICATION"
    static let ERROR_FOUND_NOTIFICATION = "ERROR_FOUND_NOTIFICATION"
    static let GET_TRANSLATE_NOTIFICATION = "GET_TRANSLATE_NOTIFICATION"
    static let TRANSLATE_RESULT_KEY = "TRANSLATE_RESULT_KEY"
    static let TEXT_TRANSLATED_KEY = "text"
    static let API_HEADER_KEY = "X-Mashape-Key"

    enum LanguageType: Int {
        case origin = 0, destination
    }
    
}
