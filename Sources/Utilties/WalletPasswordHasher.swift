//
//  PasswordHasher.swift
//  Application
//
//  Created by Omar Alshammari on 27/10/1441 AH.
//

import Foundation

final class WalletPasswordHasher {
    
    static func hash(password: String) -> String {
        return password
    }
    
    static func verify(password: String, hash: String) -> Bool {
        return password == hash
    }
}
