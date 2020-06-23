
public struct Otp {
    let secret: String
    let token: Int
    
    public init(secret: String, token: Int) {
        self.secret = secret
        self.token = token
    }
}

enum OtpError : Error {
    case unableToGenerateSecret
}

protocol OtpUtil {
    
    func generateOtp(timeInterval: Int, digits: Int) -> Result<Otp, OtpError>;
    
    func validOtp(otp: Otp, step: Int, digits: Int) -> Result<Bool, Error>
    
}
