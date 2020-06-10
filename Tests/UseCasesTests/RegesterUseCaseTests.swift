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
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        XCTAssertTrue(RegisterUseCase().execute(input: input))
    }

    func testRegisterNewUserWithExistingMobileNumber() {
        XCTFail()
    }
    
    func testRegisterNewUserWithInvalidMobileNumber() {
        XCTFail()
    }

    func testRegisterNewUserWithValidFullname() {
        XCTFail()
    }

    func testRegisterNewUserWithInvalidFullname() {
        XCTFail()
    }

    static let allTests = [
        ("testRegisterNewUserWithMobileNumber", testRegisterNewUserWithNewMobileNumber),
        ("testRegisterNewUserWithExistingMobileNumber", testRegisterNewUserWithExistingMobileNumber),
        ("testRegisterNewUserWithInvalidMobileNumber", testRegisterNewUserWithInvalidMobileNumber),
        ("testRegisterNewUserWithValidFullname", testRegisterNewUserWithValidFullname),
        ("testRegisterNewUserWithInvalidFullname", testRegisterNewUserWithInvalidFullname)
    ]
}
