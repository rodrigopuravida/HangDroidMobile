//
//  Result.swift
//  HangDroidMobile
//
//  Created by Rodrigo Carballo on 10/2/15.
//  Copyright © 2015 Rodrigo Carballo. All rights reserved.
//

import Foundation

class Box<T> {
    var value: T
    init(_ value: T) {self.value = value}
}

enum Result<T> {
    case Error(NSError)
    case Value(Box<T>)
}
