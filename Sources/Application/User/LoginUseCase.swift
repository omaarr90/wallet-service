//
//  File.swift
//  
//
//  Created by Omar Alshammari on 18/10/1441 AH.
//

import Foundation
import Hydra

struct LoginUseCase: UseCase {
    struct LoginInput {
        //
    }
    
    struct LoginOutput {
        let success: Bool
    }
    
    typealias Input = LoginInput
    
    typealias Output = LoginOutput
    
    func execute(input: LoginInput) -> Promise<LoginOutput> {
        return Promise<LoginOutput> { (resolver, rejecter, status) in
            resolver(LoginOutput(success: true))
            return
        }
        
    }
    
}
