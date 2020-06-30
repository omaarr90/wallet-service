//todo remove SwiftOTP

import SwiftOTP
import Foundation

public class OtpSecrets {

    /// Generates a base32 enconded secret.
    ///
    ///  @param size - Byte size of generated secret.
    ///  @returns base32 encoded secret
    public func generateSecret(length: Int = 32) -> String? {
        var bytes = [UInt8](repeating: 0, count: length)
        let status = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)

        if status == errSecSuccess {
            return base32Encode(bytes).replacingOccurrences(of: "=", with: "")
        }
        return nil
    }
}