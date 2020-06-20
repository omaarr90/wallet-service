//
//  WalletPasswordHasherTests.swift
//  UtiltiesTests
//
//  Created by عمر سعيد الشمري on 20/06/2020.
//

import XCTest
@testable import Utilties

final class WalletPasswordHasherTests: XCTestCase {
    
    
    func testHashPasswprd() {
        guard let hashed = WalletPasswordHasher.hash(password: "p@ssw0rd") else {
            XCTFail("Couldn't create hash")
            return
        }
        XCTAssertTrue(hashed != "p@sswo0rd")
        XCTAssertTrue(hashed.count == 60)
    }
    
    func testVerifyPassword() {
        let digest = "$2a$04$TI13sbmh3IHnmRepeEFoJOkVZWsn5S1O8QOwm8ZU5gNIpJog9pXZm"
        let plain = "vapor"
        
        let result = WalletPasswordHasher.verify(password: plain, hash: digest)
        XCTAssertTrue(result)
    }

    static let allTests = [
        ("testHashPasswprd", testHashPasswprd)
    ]
}
