//
//  RegisterUseCase.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Entities
import Utilties

public struct RegisterUseCase: UseCase {
    
    private var provider: UserProvider
    
    struct RegisterInput {
        let fullname: String
        let phoneNumber: Int
    }
    
    typealias Input = RegisterInput
    
    typealias Output = Bool
    
    init(provider: UserProvider) {
        self.provider = provider
    }

    func execute(input: RegisterInput) -> Bool {
        
        guard !input.fullname.isEmpty else {
            return false
        }
        
        guard input.phoneNumber.isValidSaudiNumber() else {
            return false
        }
        
        guard !provider.allUsers().contains(where: { user in
            user.phoneNumber == input.phoneNumber
        }) else {
            return false
        }
        
        let username = String.generateRanomUsername(from: input.fullname)
        
        let user = User(fullname: input.fullname, username: username, phoneNumber: input.phoneNumber)
        
        return provider.save(user: user)
    }

}
