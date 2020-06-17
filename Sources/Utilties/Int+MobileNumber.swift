//
//  Int+MobileNumber.swift
//  Utilties
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation

public extension Int64 {
    func isValidSaudiNumber() -> Bool {
        let str = "\(self)"
        
        guard str.count == 12 else { return false }
        guard str.starts(with: "966") else { return false }
        
        return true
    }
}
