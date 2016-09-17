//
//  Person.swift
//  ControlFlow Early Exit
//
//  Created by Wlad Dicario on 23/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import Foundation

class Person: NSObject {
    
    var userName:String
    var familyName:String
    var age: String
    
    override init() {
        userName = "user"
        familyName = "family"
        age = "\(Date())"
        super.init()
    }
    
    init(userName:String, familyName:String, age:String) {
        self.userName = userName
        self.familyName = familyName
        self.age = age
        super.init()
    }
}
