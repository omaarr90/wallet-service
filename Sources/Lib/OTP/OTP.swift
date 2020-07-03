/*
 based on https://github.com/lolivei/behin
*/

import CryptoSwift

public enum Alg {
    case SHA1
    case SHA256
    case SHA512

    func hmacVariant() -> HMAC.Variant {
        switch self {
        case .SHA1:
            return .sha1
        case .SHA256:
            return .sha256
        case .SHA512:
            return .sha512
        }
    }
}

public enum OtpDigits {
    case six
    case seven
    case eight
    func Val() -> Int {
        switch self {
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        }
    }
}

public struct IOptions {
    /**
     * Time step in seconds
     *
     * **Default:** 30
     */
    let step: Int
    /**
     * Margin allowed.
     * For instance, if window = 1, validation function will allow tokens from 1 step before and 1 step after the current time.
     *
     * **Default:** 0
     */
    let window: Int
    /**
     * Length of the generated token.
     *
     * **Default:** 6
     */
    let digits: OtpDigits
    /**
     * Hash algorithm (sha1, sha256, sha512)
     *
     * **Default:** sha1
     */
    let alg: Alg

    public init(step: Int = 30, window: Int = 0, digits: OtpDigits = .six, alg: Alg = .SHA1) {
        self.step = step
        self.window = window
        self.digits = digits
        self.alg = alg
    }

}