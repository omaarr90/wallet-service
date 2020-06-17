//
//  RegisterUseCase.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain
import Utilties

public struct RegisterUseCaseImpl {
    
    private var provider: UserRepository
    
    public struct RegisterInput {
        public let fullname: String
        public let phoneNumber: Int64
        
        public init(fullname: String, phoneNumber: Int64) {
            self.fullname = fullname
            self.phoneNumber = phoneNumber
        }
    }
    
    public typealias Input = RegisterInput
    
    public typealias Output = User
    
    public init(provider: UserRepository) {
        self.provider = provider
    }
    
    public func execute(input: RegisterInput, completion: @escaping (Result<User, Error>) -> Void) {
        guard !input.fullname.isEmpty else {
            let error = UseCaseError.invalidInput(reason: "Full name must not be empty")
            completion(.failure(error))
            return
        }
        
        guard input.phoneNumber.isValidSaudiNumber() else {
            let error = UseCaseError.invalidInput(reason: "Mobile number should be a valid Saudi mobile number")
            completion(.failure(error))
            return
        }
        
        provider.allUsers { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(users):
                if users.contains(where: { user in
                    user.phoneNumber == input.phoneNumber
                }) {
                    completion(.failure(UseCaseError.duplicateInput))
                } else {
                    let username = String.generateRanomUsername(from: input.fullname)
                    
                    let user = User(fullname: input.fullname, username: username, phoneNumber: input.phoneNumber)
                    
                    self.provider.save(user: user) { result in
                        completion(result)
                    }
                }
            }
        }
    }
    
}
