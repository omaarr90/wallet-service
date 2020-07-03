//
//  File.swift
//
//
//  Created by عمر سعيد الشمري on 20/06/2020.
//

@testable import VaporApp
import XCTVapor

final class CreatePasswordTests: AppTestCase {

    func testCreatePasswordForNewUser() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users/password", headers: headers, body: validCreatePasswordBody) {
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

    func testCreatePasswordForExistingUser() throws {
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users/password", headers: headers, body: duplicateCreatePasswordBody) {
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

    func testCreatePasswordWithInvalidMobileNumber() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users/password", headers: headers, body: invalidMobileCreateUserBody) {
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

    func testCreatePasswordWithEmptyPassword() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users/password", headers: headers, body: emptyPasswordBody) {
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

    func testCreatePasswordWithInvalidJson() throws {
        // Add your tests here
        let expectation = self.expectation(description: "Registering")
        var expectedResponse: XCTHTTPResponse?
        try app.test(.POST, "users/password", headers: headers, body: invalidJsonBody) {
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
        ("testCreatePasswordForNewUser", testCreatePasswordForNewUser),
        ("testCreatePasswordForExistingUser", testCreatePasswordForExistingUser),
        ("testCreatePasswordWithInvalidMobileNumber", testCreatePasswordWithInvalidMobileNumber),
        ("testCreatePasswordWithEmptyPassword", testCreatePasswordWithEmptyPassword),
        ("testCreatePasswordWithInvalidJson", testCreatePasswordWithInvalidJson),

    ]

    private var validCreatePasswordBody: ByteBuffer? {
        let json = """
        {
            "password": "p@ssw0rd",
            "phoneNumber": 966542652273
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var duplicateCreatePasswordBody: ByteBuffer? {
        let json = """
        {
            "password": "p@ssw0rd",
            "phoneNumber": 966542652274
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var invalidMobileCreateUserBody: ByteBuffer? {
        let json = """
        {
            "fullname": "Omar Alshammari",
            "phoneNumber": 966542652
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var emptyPasswordBody: ByteBuffer? {
        let json = """
        {
            "fullname": "",
            "phoneNumber": 966542652273
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

    private var invalidJsonBody: ByteBuffer? {
        let json = """
        {
        }
        """
        let data = Data(json.utf8)
        return ByteBuffer(data: data)
    }

}
