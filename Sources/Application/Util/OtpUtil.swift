import Lib
public struct Otp {
    let token: String
    let secret: String

    init(token: String, secret: String) {
        self.token = token
        self.secret = secret
    }
}

enum OtpError: Error {
    case unableToGenerateSecret
    case unableToGenerateOtp
}

protocol OtpUtil {

    func generateOtp(timeInterval: Int, digits: OtpDigits, algorithm: Alg) -> Result<Otp, OtpError>

    func validOtp(otp: Otp, timeInterval: Int, digits: OtpDigits, algorithm: Alg) -> Bool

}
