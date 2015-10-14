//
//  JSONHelper.swift
//  HangDroidMobile
//
//  Created by Rodrigo Carballo on 10/2/15.
//  Copyright © 2015 Rodrigo Carballo. All rights reserved.
//

import Foundation

typealias JSON = AnyObject
typealias JSONDictionary = [String: JSON]
typealias JSONDictionaryArray = [JSONDictionary]

func JSONString(object: JSON) -> String? {
    return object as? String
}

func JSONInt(object: JSON) -> Int? {
    return object as? Int
}

func JSONDict(object: JSON) -> JSONDictionary? {
    return object as? JSONDictionary
}