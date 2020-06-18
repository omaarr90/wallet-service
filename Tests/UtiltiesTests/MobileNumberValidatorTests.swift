//
//  MobileNumberValidatorTests.swift
//  Application
//
//  Created by عمر سعيد الشمري on 17/06/2020.
//

import XCTest
@testable import Utilties

final class MobileNumberValidatorTests: XCTestCase {
    
    func testValidSaudiNumber() {
        let validMobile: Int64 = 966542652273
        XCTAssertTrue(validMobile.isValidSaudiNumber())
    }

    func testInvalidSaudiNumber() {
        let invalidMobile: Int64 = 96654265227
        XCTAssertFalse(invalidMobile.isValidSaudiNumber())
    }

    static let allTests = [
        ("testValidSaudiNumber", testValidSaudiNumber),
        ("testInvalidSaudiNumber", testInvalidSaudiNumber)
    ]
}

