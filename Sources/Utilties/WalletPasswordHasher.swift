//
//  PasswordHasher.swift
//  Application
//
//  Created by Omar Alshammari on 27/10/1441 AH.
//

import Foundation
import Vapor

public final class WalletPasswordHasher {
    
    public static func hash(password: String) -> String? {
        return try? Vapor.Bcrypt.hash(password)
    }
    
    public static func verify(password: String, hash: String) -> Bool {
        guard let result = try? Vapor.Bcrypt.verify(password, created: hash) else {
            return false
        }
        return result
    }
}
