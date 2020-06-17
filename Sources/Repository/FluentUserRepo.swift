//
//  FluentUserRepo.swift
//  Repository
//
//  Created by Omar Alshammari on 25/10/1441 AH.
//

import Foundation
import Domain
import Application
import Fluent

public class FluentUserRepo: UserRepository {
    
    private let database: Database
    public init(database: Database) {
        self.database = database
    }
    
    public func allUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let allUsers = UserModel.query(on: database).all().mapEach { userModel -> User in
            Domain.User(fullname: userModel.fullname, username: userModel.username, phoneNumber: userModel.phoneNumber)
        }
        allUsers.whenComplete { result in
            print("11111111")
            completion(result)
        }
    }
    
    public func save(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        let userModel = UserModel(id: nil, fullname: user.fullname, username: user.username, phoneNumber: user.phoneNumber)
        userModel.save(on: database).whenComplete { result in
            switch result {
            case .success:
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
