import XCTest
@testable import Lib

final class OtpSecretsTest: XCTestCase {


    func testGeneratedSecretLength() {
        let otpSecrets = OtpSecrets()
        let totp = Totp()
        guard let secret = otpSecrets.generateSecret() else {
            XCTFail("unable to generate secret")
            return
        }
        XCTAssertTrue(secret.count == 96)
    }

    static let allTests = [
        ("testGeneratedSecretLength", testGeneratedSecretLength)
    ]

}