

import SwiftOTP
import Foundation

public struct OtpUtilImpl: OtpUtil{
    
    func generateOtp(timeInterval: Int, digits: Int) -> Result<Otp, OtpError> {
        //TOTP
        guard let data = base32DecodeToData("ABCDEFGHIJKLMNOP") else {
            return .failure(.unableToGenerateSecret)
        }
        debugPrint("data: \(data)")

        guard let totp = TOTP(secret: data, digits: digits, timeInterval: timeInterval, algorithm: .sha1)  else {
            return .failure(.unableToGenerateSecret)
        }
        debugPrint("totp: \(totp)")

        guard let otpString = totp.generate(time: Date()) else {
            return .failure(.unableToGenerateSecret)
        }
        debugPrint("otpString: \(otpString)")

        let tokanAndSecret = Otp(secret: "ABCDEFGHIJKLMNOP", token: Int(otpString)!)
       
        return .success(tokanAndSecret)
    }
    
    
    func validOtp(otp: Otp, step: Int, digits: Int) -> Result<Bool, Error> {
        .success(true)
    }
    
}
