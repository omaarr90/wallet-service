//
//  RegesterUseCaseTests.swift
//  App
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import XCTest
@testable import UseCases

final class RegesterUseCaseTests: XCTestCase {
    
    func testRegisterNewUserWithNewMobileNumber() {
        XCTFail()
    }

    func testRegisterNewUserWithExistingMobileNumber() {
        XCTFail()
    }
    

    static let allTests = [
        ("testRegisterNewUserWithMobileNumber", testRegisterNewUserWithNewMobileNumber),
        ("testRegisterNewUserWithExistingMobileNumber", testRegisterNewUserWithExistingMobileNumber)
    ]
}
