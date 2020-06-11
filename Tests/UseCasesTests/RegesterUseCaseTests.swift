//
//  RegesterUseCaseTests.swift
//  App
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import XCTest
import Providers
@testable import UseCases

final class RegesterUseCaseTests: XCTestCase {
    

    private let emptyUserProviderMock = EmptyUserProviderMock()
    private let userProviderMock = UserProviderMock()
    
    func testRegisterNewUserWithNewMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        XCTAssertTrue(RegisterUseCase(provider: emptyUserProviderMock).execute(input: input))
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
