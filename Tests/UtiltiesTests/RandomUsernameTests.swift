import XCTest
@testable import Utilties

final class RandomUsernameTests: XCTestCase {
    
    func testGenerateRandomUsername() {
        let fullName = "Omar Alshammari"
        let username = String.generateRanomUsername(from: fullName)
        XCTAssertTrue(username.starts(with: "omar_"))
        let onlyNumbers = username.components(separatedBy: "_")[1]
        XCTAssertTrue(onlyNumbers.count == 6)
        XCTAssertTrue(onlyNumbers.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil)
    }

    static let allTests = [
        ("testGenerateRandomUsername", testGenerateRandomUsername)
    ]
}

