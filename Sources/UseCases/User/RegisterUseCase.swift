//
//  RegisterUseCase.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation

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
        return false
    }

}
