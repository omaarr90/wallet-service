//
//  File.swift
//  
//
//  Created by Omar Alshammari on 18/10/1441 AH.
//

import Foundation

struct LoginUseCase {
    
    struct LoginInput {
        //
    }
    
    struct LoginOutput {
        let success: Bool
    }
    
    typealias Input = LoginInput
    
    typealias Output = LoginOutput
    
    func execute(input: Input, completion: @escaping (Result<Output, Error>) -> Void) {
        completion(.success(LoginOutput(success: true)))        
    }
    
}
