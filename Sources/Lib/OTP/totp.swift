/*
 based on https://github.com/lolivei/behin
*/

import Foundation

public class Totp {
    public init() {

    }

    /// Generates a time based one-time password for a given secret at the current time.
    ///
    /// @param secret Shared secret between server and client.
    /// @param options
    /// @returns OTP token string
    public func generate(secret: String, options: IOptions) -> Result<String, DigestOptionsError> {
        let hotp = Hotp()
        let counter: Int = Int(floor(Double(Date().timeIntervalSince1970 * 1000) / Double(options.step) / 1000))
        return hotp.generate(secret: secret, counter: counter, options: options);
    }


    /// Validates a OTP token against a given secret. By default verifies the token only at the current time window.
    ///
    /// A margin can be specified on the `window` option
    /// @param secret Shared secret between server and client.
    /// @param token OTP token to be verified
    /// @param options
    /// @returns Returns the step difference between the client and server. If token is not valid returns null
    public func delta(secret: String, token: String, options: IOptions) -> Result<Int, DeltaError> {
        let hotp = Hotp()
        let window = options.window
        let counter: Int = Int(floor(Double(Date().timeIntervalSince1970 * 1000) / Double(options.step) / 1000))

        let tempOptions = IOptions(step: options.step, window: options.window + options.window, digits: options.digits, alg: options.alg)
        let delta = hotp.delta(secret: secret, token: token, counter: Int(counter) - window, options: tempOptions);
        switch delta {
        case .failure(let error):
            switch error {
            case .noMatchWithinTheWindow:
                return .failure(.noMatchWithinTheWindow)
            case .wrongToken:
                return .failure(.wrongToken)
            }
        case .success(let deltaVal):
            return .success(deltaVal - options.window)
        }
    }

    /// Verifies a time-based OTP token against a base32 encoded secret. Uses the delta function in order to validate the token.
    ///
    /// @param secret Shared secret between server and client.
    /// @param token OTP token to be verified.
    /// @param options
    ///
    /// @returns True if tokens matches for the given secret and current time window.
    public func verify(secret: String, token: String, options: IOptions) -> Bool {
        switch delta(secret: secret, token: token, options: options) {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}