//
//  CreatePasswordUseCase.swift
//  Application
//
//  Created by Omar Alshammari on 27/10/1441 AH.
//

import Foundation
import Domain
import Utilties

public struct CreatePasswordUseCaseImpl: CreatePasswordUseCase {
    
    private let repo: UserRepository
    

    public init(repo: UserRepository) {
        self.repo = repo
    }
    
    public func execute(input: CreatePasswordUseCaseInput, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    
}
