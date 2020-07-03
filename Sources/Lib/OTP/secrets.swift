/*
 based on https://github.com/lolivei/behin
*/

import Foundation
import Vapor
import Base32

public class OtpSecrets {
    public init() {

    }

    /// Generates a base32 enconded secret.
    ///
    ///  @param size - Byte size of generated secret.
    ///  @returns base32 encoded secret
    public func generateSecret(length: Int = 32) -> String? {
        guard let hashSalted = try? Vapor.Bcrypt.hash("secret", cost: 12) else {
            return nil
        }
        return hashSalted.base32EncodedString.replacingOccurrences(of: "=", with: "")
    }
}
