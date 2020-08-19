//
//  PersonTests.swift
//  VKProjectTests
//
//  Created by Denis Abramov on 15.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import VKProject

class PersonTests: XCTestCase {
    
    var person: Person!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        person = Person(login: "Foo", password: "Bar")
    }
    
    override func tearDownWithError() throws {
        person = nil
        try super.tearDownWithError()
    }
    
    func testInitPersonWithLoginAndPassword() {
        XCTAssertNotNil(person)
    }
    
    func testWhenGivenLoginAndPasswordSetsLoginAndPassword() {
        XCTAssertEqual(person.login, "Foo")
        XCTAssertEqual(person.password, "Bar")
    }
    
    func testInitPersonWithDate() {
        XCTAssertNotNil(person.date)
    }
}
