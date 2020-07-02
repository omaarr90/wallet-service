import XCTest
@testable import Lib

final class TotpTest: XCTestCase {


    func testGenerateOtp() {
        let otpSecrets = OtpSecrets()
        let totp = Totp()
        guard let secret = otpSecrets.generateSecret() else {
            XCTFail("unable to generate secret")
            return
        }
        print(secret)
        switch totp.generate(secret: secret, options: IOptions()) {
        case .failure:
            XCTFail("unable to generate token")
        case .success(let token):
            print(token)
            XCTAssertTrue(token.isInt)
            XCTAssertTrue(token.count == 6)
        }
    }

    func testVerifyOtpWithinWindowTime() {
        let otpSecrets = OtpSecrets()
        let totp = Totp()
        guard let secret = otpSecrets.generateSecret() else {
            XCTFail("unable to generate secret")
            return
        }
        switch totp.generate(secret: secret, options: IOptions()) {
        case .failure:
            XCTFail("unable to generate token")
        case .success(let token):
            let valid = totp.verify(secret: secret, token: token, options: IOptions())
            XCTAssertTrue(valid)
        }
    }

    func testVerifyOtpAfterWindowTime() {
        let otpSecrets = OtpSecrets()
        let totp = Totp()
        guard let secret = otpSecrets.generateSecret() else {
            XCTFail("unable to generate secret")
            return
        }
        //generate otp that is valid for 4 sec
        switch totp.generate(secret: secret, options: IOptions(step: 4, window: 0)) {
        case .failure:
            XCTFail("unable to generate token")
        case .success(let token):
            //wait for 6 sec then verify
            do {
                sleep(6)
            }
            let valid = totp.verify(secret: secret, token: token, options: IOptions())
            XCTAssertTrue(!valid)
        }
    }

    static let allTests = [
        ("testGenerateOtp", testGenerateOtp),
        ("testVerifyOtpWithinWindowTime", testVerifyOtpWithinWindowTime),
        ("testVerifyOtpAfterWindowTime", testVerifyOtpAfterWindowTime)
    ]

}

extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}