//
//  RegesterUseCaseTests.swift
//  App
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import XCTest
import Persistance
import Hydra
@testable import Application

final class RegesterUseCaseTests: XCTestCase {
    

    private let emptyUserProviderMock = EmptyUserProviderMock()
    private let userProviderMock = UserProviderMock()
    
    func testRegisterNewUserWithNewMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        let useCase = RegisterUseCase(provider: emptyUserProviderMock)
        do {
            let result = try await(useCase.execute(input: input))
            XCTAssertTrue(result.fullname == input.fullname)
            XCTAssertTrue(result.phoneNumber == input.phoneNumber)
            XCTAssertNotNil(result.username)
        } catch let error {
            XCTFail("\(error.localizedDescription)")
        }
    }

    func testRegisterNewUserWithExistingMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        let useCase = RegisterUseCase(provider: userProviderMock)
        do {
            let result = try await(useCase.execute(input: input))
            XCTFail("Should thorw duplicate error")
        } catch {
            XCTAssert(true)
        }
    }
    
    func testRegisterNewUserWithInvalidMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 9665426522)
        let useCase = RegisterUseCase(provider: emptyUserProviderMock)
        do {
            let result = try await(useCase.execute(input: input))
            XCTFail("Should throw invalid input error")
        } catch {
            XCTAssert(true)
        }
    }

    func testRegisterNewUserWithEmptyFullname() {
        let input = RegisterUseCase.Input(fullname: "", phoneNumber: 966542652273)
        let useCase = RegisterUseCase(provider: emptyUserProviderMock)
        do {
            let result = try await(useCase.execute(input: input))
            XCTFail("Should throw invalid input error")
        } catch {
            XCTAssert(true)
        }
    }

    static let allTests = [
        ("testRegisterNewUserWithMobileNumber", testRegisterNewUserWithNewMobileNumber),
        ("testRegisterNewUserWithExistingMobileNumber", testRegisterNewUserWithExistingMobileNumber),
        ("testRegisterNewUserWithInvalidMobileNumber", testRegisterNewUserWithInvalidMobileNumber),
        ("testRegisterNewUserWithEmptyFullname", testRegisterNewUserWithEmptyFullname)
    ]
}
