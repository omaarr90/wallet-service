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
    
    public func execute(input: CreatePasswordUseCaseInput, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let hashedPassword = WalletPasswordHasher.hash(password: input.password) else {
            let error = UseCaseError.invalidInput(reason: "Password couldn't be hashed")
            completion(.failure(error))
            return
        }
        repo.saveUserPassword(phoneNumber: input.phoneNumber, password: hashedPassword) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success:
                completion(.success(true))
            }
        }
    }
    
}
