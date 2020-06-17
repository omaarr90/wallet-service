//
//  RegisterUseCase.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain
import Utilties

public struct RegisterByPhoneUseCaseImpl: RegisterUseCase {
    
    private let repo: UserRepository
    

    public init(repo: UserRepository) {
        self.repo = repo
    }
    
    public func execute(input: RegisterUseCaseInput, completion: @escaping (Result<User, Error>) -> Void) {
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
        
        repo.allUsers { result in
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
                    
                    self.repo.save(user: user) { result in
                        completion(result)
                    }
                }
            }
        }
    }
    
}
