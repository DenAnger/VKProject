//
//  LoginFormVCTests.swift
//  VKProjectTests
//
//  Created by Denis Abramov on 19.08.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import VKProject

class LoginFormVCTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedScrollViewIsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "LoginFormVC") as! LoginFormVC
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.scrollView)
    }
}
