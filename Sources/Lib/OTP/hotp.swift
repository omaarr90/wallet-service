/*
 based on https://github.com/lolivei/behin
*/

import Foundation
import SwiftOTP
import CryptoSwift

public enum DigestOptionsError: Error {
    case unableToDecodeToBase32
}

public enum DeltaError: Error {
    case wrongToken
    case noMatchWithinTheWindow
}


public class Hotp {

    //postfix secret with =
    private func padBase32(secret: String) -> String {
        let max = Int(ceil(Double(secret.count) / 8)) * 8;
        return secret.padding(toLength: max, withPad: "=", startingAt: 0).uppercased();
    }

    private func digestOptions(secret: String, counter: Int, options: IOptions) -> Result<Array<UInt8>, DigestOptionsError> {
        guard let secretBytes = base32Decode(padBase32(secret: secret)) else {
            return .failure(.unableToDecodeToBase32)
        }

        var counterBytes = [UInt8](repeating: 0, count: 8)
        var tmp = counter
        for i in 0..<8 {
            counterBytes[7 - i] = UInt8(tmp & 0xff)
            tmp = tmp >> 8;
        }

        let hmac: Array<UInt8> = try! HMAC(key: secretBytes, variant: options.alg.hmacVariant()).authenticate(counterBytes)
        return .success(hmac);
    }

    /// Generates a HMAC-based one-time password.
    /// Specify the key and counter, and receive the OTP for the given counter position.
    ///
    /// @param secret Shared secret between server and client.
    /// @param counter Counter value.
    /// @param options
    /// @returns OTP token
    public func generate(secret: String, counter: Int, options: IOptions) -> Result<String, DigestOptionsError> {
        switch digestOptions(secret: secret, counter: counter, options: options) {
        case .failure(let error):
            return .failure(error)
        case .success(let digest):
            // calculate binary code (RFC4226 5.4)
//            var offset = digest[digest.count - 1] & 0xf;
//            let code = (digest[Int(offset)] & 0x7f) << 24 |
//                (digest[Int(offset) + 1] & 0xff) << 16 |
//                (digest[Int(offset) + 2] & 0xff) << 8 |
//                (digest[Int(offset) + 3] & 0xff);

            let offset = digest[digest.count - 1] & 0xf;

            var code: UInt32 = 0
            code |= UInt32((digest[Int(offset)] & 0x7f));
            code = code << 24
            code |= UInt32((digest[Int(offset) + Int(1)] & 0xff))
            code = code << 16
            code |= UInt32((digest[Int(offset) + Int(2)] & 0xff))
            code = code << 8
            code |= UInt32((digest[Int(offset) + Int(3)] & 0xff))

            // left-pad code
            let lfCode = String(repeating: "0", count: options.digits.Val() + 1) + String(code, radix: 10);

            //substring last char
            let from = lfCode.count - options.digits.Val()
            let token = lfCode[from...]
            return .success(token)
        }
    }

    ///  Validates a OTP token against a given secret. By default verifies the token only at the given counter.
    ///
    /// A margin can be specified on the `window` option
    /// @param secret Shared secret between server and client.
    /// @param token OTP token to be verified
    /// @param counter Counter value.
    /// @param options
    /// @returns Returns the counter difference between the client and server. If token is not valid returns null
    public func delta(secret: String, token: String, counter: Int, options: IOptions) -> Result<Int, DeltaError> {
        if token.count != options.digits.Val() {
            //length not macthed
            return .failure(.wrongToken);
        }

        for i in counter...(counter + options.window) {
            switch generate(secret: secret, counter: i, options: options) {
            case .failure:
                continue
            case .success(let generatedToken):
                if generatedToken == token {
                    return .success(i - counter)
                }
            }
        }
        return .failure(.noMatchWithinTheWindow);
    }

    /// Verifies an OTP token against a base32 encoded secret. Uses the delta function in order to validate the token.
    ///
    /// @param secret Shared secret between server and client.
    /// @param token OTP token to be verified.
    /// @param counter Counter value.
    /// @param options
    ///
    /// @returns True if tokens matches for the given secret and counter for a given window.
    public func verify(secret: String, token: String, counter: Int, options: IOptions) -> Bool {
        switch delta(secret: secret, token: token, counter: counter, options: options) {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }
}