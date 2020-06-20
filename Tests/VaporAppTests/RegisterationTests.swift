//
//  RegisterationTests.swift
//  VaporAppTests
//
//  Created by عمر سعيد الشمري on 18/06/2020.
//

@testable import VaporApp
import XCTVapor

final class RegisterationTests: AppTestCase {

    func testRegisteringNewUser() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users", headers: headers, body: validUserBody) {
            expectedResponse = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        guard let response = expectedResponse else {
            XCTFail("expected response was nil")
            return
        }
        XCTAssertTrue(response.status == .created)
    }

    func testRegisteringDuplicateUser() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users", headers: headers, body: duplicateUserBody) {
            expectedResponse = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        guard let response = expectedResponse else {
            XCTFail("expected response was nil")
            return
        }
        XCTAssertTrue(response.status == .badRequest)
    }

    func testRegisteringUserWithInvalidMobileNumber() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users", headers: headers, body: invalidMobileUserBody) {
            expectedResponse = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        guard let response = expectedResponse else {
            XCTFail("expected response was nil")
            return
        }
        XCTAssertTrue(response.status == .badRequest)
    }

    func testRegisteringUserWithEmptyFullname() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users", headers: headers, body: emptyFullnameUserBody) {
            expectedResponse = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        guard let response = expectedResponse else {
            XCTFail("expected response was nil")
            return
        }
        XCTAssertTrue(response.status == .badRequest)
    }

    func testRegisteringUserWithInvalidJson() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users", headers: headers, body: invalidJsonUserBody) {
            expectedResponse = $0
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        guard let response = expectedResponse else {
            XCTFail("expected response was nil")
            return
        }
        XCTAssertTrue(response.status == .badRequest)
    }

    static let allTests = [
        ("testRegisteringNewUser", testRegisteringNewUser),
        ("testRegisteringDuplicateUser", testRegisteringDuplicateUser),
        ("testRegisteringUserWithInvalidMobileNumber", testRegisteringUserWithInvalidMobileNumber),
        ("testRegisteringUserWithEmptyFullname", testRegisteringUserWithEmptyFullname),
        ("testRegisteringUserWithInvalidJson", testRegisteringUserWithInvalidJson)
    ]
    
    
    private var validUserBody: ByteBuffer? {
        let json = """
        {
            "fullname": "Ahmed Alahmed",
            "phoneNumber": 966542652255
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var duplicateUserBody: ByteBuffer? {
        let json = """
        {
            "fullname": "Omar Alshammari",
            "phoneNumber": 966542652273
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var invalidMobileUserBody: ByteBuffer? {
        let json = """
        {
            "fullname": "Omar Alshammari",
            "phoneNumber": 966542652
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var emptyFullnameUserBody: ByteBuffer? {
        let json = """
        {
            "fullname": "",
            "phoneNumber": 966542652273
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }
    
    private var invalidJsonUserBody: ByteBuffer? {
        let json = """
        {
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

}
