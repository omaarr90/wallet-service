
import XCTest
@testable import Application


final class OtpUtilTests: XCTestCase{
    
    let otpUtil: OtpUtil = OtpUtilImpl()
    
    func generateOtp(){
        otpUtil.generateOtp(timeInterval: 60, digits: 4)
    }
    
    func verifyOtp(){
        
    }
}
