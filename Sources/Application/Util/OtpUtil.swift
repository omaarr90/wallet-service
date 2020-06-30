import SwiftOTP

struct Otp {
    let token: Int
    let secret: String

    init(token: Int, secret: String) {
        self.token = token
        self.secret = secret
    }
}

enum OtpError: Error {
    case unableToDecodeSecret
    case unableToCreateTotpObjectWithSettings
    case unableToGenerateOtp
    case unableToGenerateOtpToVerifyAgainst
}

enum VerifyOtpError: Error {
    case unableToGenerateOtpToVerifyAgainst
}

protocol OtpUtil {

    func generateOtp(timeInterval: Int, digits: Int, algorithm: OTPAlgorithm) -> Result<Otp, OtpError>

    func validOtp(otp: Otp, timeInterval: Int, digits: Int, algorithm: OTPAlgorithm) -> Result<Bool, VerifyOtpError>

}
