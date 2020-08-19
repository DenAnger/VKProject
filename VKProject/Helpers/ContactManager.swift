//
//  ContactManager.swift
//  VKProject
//
//  Created by Denis Abramov on 19.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

class ContactManager {
    var contactsCount: Int {
        return persons.count
    }
    
    private var persons: [Person] = []
    
    func add(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
        }
    }
    
    func person(at index: Int) -> Person {
        return persons[index]
    }
}
