//
//  File.swift
//  
//
//  Created by Omar Alshammari on 18/10/1441 AH.
//

import Foundation


struct LoginUseCase: UseCase {
    struct LoginInput: UseCaseInput {
        //
    }
    
    struct LoginOutput: UseCaseOutput {
        let success: Bool
    }
    
    typealias Input = LoginInput
    
    typealias Output = LoginOutput
    
        
    func execute(input: Input) -> Output {
        return Output(success: true)
    }

}
