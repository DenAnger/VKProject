//
//  ContactManagerTests.swift
//  VKProjectTests
//
//  Created by Denis Abramov on 19.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import VKProject

class ContactManagerTests: XCTestCase {
    
    var contactManager: ContactManager!
    var person: Person!

    override func setUpWithError() throws {
        try super.setUpWithError()
        contactManager = ContactManager()
        person = Person(login: "Foo", password: "Bar")
    }

    override func tearDownWithError() throws {
        contactManager = nil
        person = nil
        try super.tearDownWithError()
    }

    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }
    
    func testAddPersonIncrementContactListCount() {
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
    func testContactAtIndexIsAddedPerson() {
        contactManager.add(person: person)
        let returnedPerson = contactManager.person(at: 0)
        XCTAssertEqual(person.login, returnedPerson.login)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        contactManager.add(person: Person(login: "Foo", password: "Bar"))
        contactManager.add(person: Person(login: "Foo", password: "Bar"))
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
}
