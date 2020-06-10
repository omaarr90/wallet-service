//
//  RegisterUseCase.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation

struct RegisterUseCase: UseCase {
    
    struct RegisterInput {
        let fullname: String?
        let phoneNumber: Int
    }
    
    typealias Input = RegisterInput
    
    typealias Output = Bool

    func execute(input: RegisterInput) -> Bool {
        return true
    }

}
