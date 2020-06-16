//
//  RegesterUseCaseTests.swift
//  App
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import XCTest
import Persistance
@testable import Application

final class RegesterUseCaseTests: XCTestCase {
    

    private let emptyUserProviderMock = EmptyUserProviderMock()
    private let userProviderMock = UserProviderMock()
    
    func testRegisterNewUserWithNewMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        let useCase = RegisterUseCase(provider: emptyUserProviderMock)
        let expectation = self.expectation(description: "Scaling")
        var result: Result<RegisterUseCase.Output, Error>?
        useCase.execute(input: input) {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(result)
        switch result! {
        case let .failure(error):
            XCTFail(error.localizedDescription)
        case let .success(output):
            XCTAssertTrue(output.fullname == input.fullname)
            XCTAssertTrue(output.phoneNumber == input.phoneNumber)
            XCTAssertNotNil(output.username)

        }
    }

    func testRegisterNewUserWithExistingMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 966542652273)
        let useCase = RegisterUseCase(provider: userProviderMock)
        let expectation = self.expectation(description: "Scaling")
        var result: Result<RegisterUseCase.Output, Error>?
        useCase.execute(input: input) {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(result)
        switch result! {
        case .failure:
            XCTAssert(true)
        case .success:
            XCTFail("Should thorw duplicate error")
        }
    }
    
    func testRegisterNewUserWithInvalidMobileNumber() {
        let input = RegisterUseCase.Input(fullname: "Omar Alshammari", phoneNumber: 9665426522)
        let useCase = RegisterUseCase(provider: emptyUserProviderMock)
        let expectation = self.expectation(description: "Scaling")
        var result: Result<RegisterUseCase.Output, Error>?
        useCase.execute(input: input) {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(result)
        switch result! {
        case .failure:
            XCTAssert(true)
        case .success:
            XCTFail("Should throw invalid input error")
        }
    }

    func testRegisterNewUserWithEmptyFullname() {
        let input = RegisterUseCase.Input(fullname: "", phoneNumber: 966542652273)
        let useCase = RegisterUseCase(provider: emptyUserProviderMock)
        let expectation = self.expectation(description: "Scaling")
        var result: Result<RegisterUseCase.Output, Error>?
        useCase.execute(input: input) {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(result)
        switch result! {
        case .failure:
            XCTAssert(true)
        case .success:
            XCTFail("Should throw invalid input error")
        }
    }

    static let allTests = [
        ("testRegisterNewUserWithMobileNumber", testRegisterNewUserWithNewMobileNumber),
        ("testRegisterNewUserWithExistingMobileNumber", testRegisterNewUserWithExistingMobileNumber),
        ("testRegisterNewUserWithInvalidMobileNumber", testRegisterNewUserWithInvalidMobileNumber),
        ("testRegisterNewUserWithEmptyFullname", testRegisterNewUserWithEmptyFullname)
    ]
}
