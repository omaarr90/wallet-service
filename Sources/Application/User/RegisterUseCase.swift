//
//  RegisterUseCase.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain
import Utilties
import Hydra

public struct RegisterUseCase: UseCase {
    
    private var provider: UserProvider
    
    struct RegisterInput {
        let fullname: String
        let phoneNumber: Int
    }
    
    typealias Input = RegisterInput
    
    typealias Output = User
    
    init(provider: UserProvider) {
        self.provider = provider
    }
    
    func execute(input: RegisterInput) -> Promise<User> {
        guard !input.fullname.isEmpty else {
            let error = UseCaseError.invalidInput(reason: "Full name must not be empty")
            return Promise(rejected: error)
        }
        
        guard input.phoneNumber.isValidSaudiNumber() else {
            let error = UseCaseError.invalidInput(reason: "Mobile number should be a valid Saudi mobile number")
            return Promise(rejected: error)
        }
        
        return provider.allUsers()
            .then { users -> Promise<User> in
                if users.contains(where: { user in
                    user.phoneNumber == input.phoneNumber
                }) {
                    throw UseCaseError.duplicateInput
                }
                
                let username = String.generateRanomUsername(from: input.fullname)
                
                let user = User(fullname: input.fullname, username: username, phoneNumber: input.phoneNumber)
                
                return self.provider.save(user: user)
        }
    }
    
}
