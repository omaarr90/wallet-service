//import XCTest
//@testable import Application
//
//
//final class OtpUtilTests: XCTestCase {
//
//    let otpUtil: OtpUtil = OtpUtilImpl()
//
//    func testGenerateOtp() {
//        let result = otpUtil.generateOtp(timeInterval: 60, digits: 6, algorithm: .sha1)
//        switch result {
//        case let .failure(error):
//            XCTFail(error.localizedDescription)
//        case let .success(output):
//            XCTAssertTrue(output.token < 1)
//        }
//    }
//
//    func testVerifyOtp() {
//
//    }
//
//    static let allTests = [
//        ("testGenerateOtp", testGenerateOtp),
//        ("testVerifyOtp", testVerifyOtp)
//    ]
//}
