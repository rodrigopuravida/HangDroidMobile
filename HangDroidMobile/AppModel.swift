//
//  AppModel.swift
//  HangDroidMobile
//
//  Created by Rodrigo Carballo on 10/14/15.
//  Copyright © 2015 Rodrigo Carballo. All rights reserved.
//


import Foundation

class AppModel: NSObject {
    let word: String
    
    override var description: String {
        return "Title: \(word)\n"
    }
    
    init(word: String?) {
        self.word = word ?? ""
    }
}

