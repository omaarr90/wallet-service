import XCTest
@testable import Application


final class OtpUtilTests: XCTestCase {

    let otpUtil: OtpUtil = OtpUtilImpl()

    func testGenerateOtp() {
        let result = otpUtil.generateOtp(timeInterval: 60, digits: .six, algorithm: .SHA1)
        switch result {
        case let .failure(error):
            XCTFail(error.localizedDescription)
        case let .success(output):
            XCTAssertTrue(output.token.count == 6 )
            XCTAssertTrue(Int(output.token) != nil)
            XCTAssertTrue(output.secret.count == 96)
        }
    }

    func testVerifyOtp() {
        let result = otpUtil.generateOtp(timeInterval: 60, digits: .six, algorithm: .SHA1)

        switch result {
        case let .failure(error):
            XCTFail(error.localizedDescription)
        case let .success(output):
            let valid = otpUtil.validOtp(otp: Otp(token: output.token, secret: output.secret), timeInterval: 60, digits: .six, algorithm: .SHA1)
            XCTAssertTrue(valid)
        }
    }

    func testVerifyOtpAfterTimePassed() {
        let result = otpUtil.generateOtp(timeInterval: 1, digits: .six, algorithm: .SHA1)

        switch result {
        case let .failure(error):
            XCTFail(error.localizedDescription)
        case let .success(output):
            do {
                sleep(2)
            }
            let valid = otpUtil.validOtp(otp: Otp(token: output.token, secret: output.secret), timeInterval: 1, digits: .six, algorithm: .SHA1)
            XCTAssertTrue(!valid)
        }
    }

    static let allTests = [
        ("testGenerateOtp", testGenerateOtp),
        ("testVerifyOtp", testVerifyOtp),
        ("testVerifyOtpAfterTimePassed", testVerifyOtpAfterTimePassed)
    ]
}
