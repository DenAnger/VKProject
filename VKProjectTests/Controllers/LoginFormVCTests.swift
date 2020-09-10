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
    
    var sut: LoginFormVC!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginFormVC") as? LoginFormVC
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedScrollViewIsNotNil() {
        XCTAssertNotNil(sut.scrollView)
    }
    
    func testHasLoginTF() {
        XCTAssertTrue(sut.loginTF.isDescendant(of: sut.scrollView))
    }
    
    func testHasPasswordTF() {
        XCTAssertTrue(sut.passwordTF.isDescendant(of: sut.scrollView))
    }
    
    func testHasSignInButton() {
        XCTAssertTrue(sut.signInButton.isDescendant(of: sut.scrollView))
    }
}
