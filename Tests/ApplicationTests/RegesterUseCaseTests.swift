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
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        XCTAssertFalse(RegisterUseCase(provider: userProviderMock).execute(input: input))
    }
    
    func testRegisterNewUserWithInvalidMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 9665426522)
        XCTAssertFalse(RegisterUseCase(provider: emptyUserProviderMock).execute(input: input))
    }

    func testRegisterNewUserWithEmptyFullname() {
        let input = RegisterUseCase.Input(fullname: "", phoneNumber: 966542652273)
        XCTAssertFalse(RegisterUseCase(provider: emptyUserProviderMock).execute(input: input))
    }

    static let allTests = [
        ("testRegisterNewUserWithMobileNumber", testRegisterNewUserWithNewMobileNumber),
        ("testRegisterNewUserWithExistingMobileNumber", testRegisterNewUserWithExistingMobileNumber),
        ("testRegisterNewUserWithInvalidMobileNumber", testRegisterNewUserWithInvalidMobileNumber),
        ("testRegisterNewUserWithEmptyFullname", testRegisterNewUserWithEmptyFullname)
    ]
}
