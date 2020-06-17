
//
//  File.swift
//  
//
//  Created by Omar Alshammari on 18/10/1441 AH.
//

import Foundation
import Domain

public enum UseCaseError: Swift.Error {
    case invalidInput(reason: String)
    case duplicateInput
    
    public var errorDescription: String? {
        switch self {
        case .duplicateInput:
            return "User Already Exist"
        case .invalidInput(let reason):
            return reason
        }
    }
}

public struct RegisterUseCaseInput {
    public let fullname: String
    public let phoneNumber: Int64
    
    public init(fullname: String, phoneNumber: Int64) {
        self.fullname = fullname
        self.phoneNumber = phoneNumber
    }
}


public protocol RegisterUseCase {
    func execute(input: RegisterUseCaseInput, completion: @escaping (Result<User, Error>) -> Void)
}
