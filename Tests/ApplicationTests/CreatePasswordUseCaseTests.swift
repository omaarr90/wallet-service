//
//  CreatePasswordUseCaseTests.swift
//  Application
//
//  Created by عمر سعيد الشمري on 20/06/2020.
//

import XCTest
import Repository
import Domain
@testable import Application

final class CreatePasswordUseCaseTests: XCTestCase {
    
    private let emptyUserProviderMock = EmptyUserRepositoryMock()
    private let userProviderMock = UserRepositoryMock()
    
    func testCreatePasswordForNewUser() {
        let input = CreatePasswordUseCaseInput(password: "p@ssw0rd", phoneNumber: 966542652273)
        let useCase = CreatePasswordUseCaseImpl(repo: userProviderMock)
        let expectation = self.expectation(description: "Creating Password")
        var expectedResult: Result<Bool, Error>?
        useCase.execute(input: input) {
            expectedResult = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        guard let result = expectedResult else {
            XCTFail("result was nil")
            return
        }
        switch result {
        case let .failure(error):
            XCTFail(error.localizedDescription)
        case let .success(output):
            XCTAssertTrue(output)
        }
    }
    
    func testCreatePasswordForExistingUser() {
        let input = CreatePasswordUseCaseInput(password: "p@ssw0rd", phoneNumber: 966542652274)
        let useCase = CreatePasswordUseCaseImpl(repo: userProviderMock)
        let expectation = self.expectation(description: "Creating Password")
        var expectedResult: Result<Bool, Error>?
        useCase.execute(input: input) {
            expectedResult = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        guard let result = expectedResult else {
            XCTFail("result was nil")
            return
        }
        switch result {
        case .failure:
            XCTAssertTrue(true)
        case .success:
            XCTFail("Shouldn't override user password")
        }
    }
    
    static let allTests = [
        ("testCreatePasswordForNewUser", testCreatePasswordForNewUser),
        ("testCreatePasswordForExistingUser", testCreatePasswordForExistingUser)
    ]
}
