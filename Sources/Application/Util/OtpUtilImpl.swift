//import SwiftOTP
//import Foundation
//import Vapor
//
//public class OtpUtilImpl: OtpUtil {
//
//    let logger = Logger(label: "OtpUtilImpl.logger")
//
//    func generateOtp(timeInterval: Int, digits: Int, algorithm: OTPAlgorithm) -> Result<Otp, OtpError> {
//        guard let secretString = generateSecret() else {
//
//        }
//        self.generateOtp(secret: secretString, timeInterval: timeInterval, digits: digits, algorithm: algorithm)
//    }
//
//
//    func validOtp(otp: Otp, timeInterval: Int, digits: Int, algorithm: OTPAlgorithm) -> Result<Bool, VerifyOtpError> {
//        switch generateOtp(secret: otp.secret, timeInterval: timeInterval, digits: digits, algorithm: algorithm) {
//        case .success(let againstOtp):
//            if (otp.token == againstOtp.token) {
//                return .success(true)
//            } else {
//                return .success(false)
//            }
//        case .failure(let otpError):
//            return .failure(.unableToGenerateOtpToVerifyAgainst)
//        }
//    }
//
//    private func generateOtp(secret: String, timeInterval: Int, digits: Int, algorithm: OTPAlgorithm) -> Result<Otp, OtpError> {
//        let secretData =  secret.data(using: String.Encoding.ascii)!
//        guard let totp = TOTP(secret: secretData, digits: digits, timeInterval: timeInterval, algorithm: algorithm) else {
//            return .failure(.unableToCreateTotpObjectWithSettings)
//        }
//        guard let otpString = totp.generate() else {
//            return .failure(.unableToGenerateOtp)
//        }
//        return .success(Otp(token: Int(otpString)!, secret: secret))
//    }
//
//    private func generateSecret(length: Int = 32) -> String? {
//        var bytes = [UInt8](repeating: 0, count: length)
//        let status = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
//
//        if status == errSecSuccess {
//            return base32Encode(bytes)
//        }
//        return nil
//    }
//
//}
