import Lib
import Foundation
import Vapor

public class OtpUtilImpl: OtpUtil {

    let logger = Logger(label: "OtpUtilImpl.logger")

    func generateOtp(timeInterval: Int, digits: Lib.OtpDigits, algorithm: Lib.Alg) -> Result<Otp, OtpError> {
        guard let secret = Lib.OtpSecrets().generateSecret() else {
            return .failure(.unableToGenerateSecret)
        }
        switch Lib.Totp().generate(secret: secret, options: Lib.IOptions(step: timeInterval, digits: digits, alg: algorithm)) {
        case .success(let token):
            return .success(Otp(token: token, secret: secret))
        case .failure(let error):
            return .failure(.unableToGenerateOtp)
        }
    }


    func validOtp(otp: Otp, timeInterval: Int, digits: OtpDigits, algorithm: Lib.Alg) -> Bool {
        Lib.Totp().verify(secret: otp.secret, token: otp.token, options: Lib.IOptions(step: timeInterval, digits: digits, alg: algorithm))
    }


}
