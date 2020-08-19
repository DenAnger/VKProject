//
//  Person.swift
//  VKProject
//
//  Created by Denis Abramov on 19.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

struct Person {
    var login: String
    var password: String
    
    private(set) var date: Date?
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
        date = Date()
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.login == rhs.login
    }
}
