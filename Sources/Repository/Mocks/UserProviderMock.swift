//
//  UserProviderMock.swift
//  Providers
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain
import Application
//import Hydra

public class UserRepositoryMock: UserRepository {
    
    
    public init() {}

    private var users = [
        User(fullname: "Omar Alshammari",
             username: "omar_123456",
             phoneNumber: 966542652273),
        User(fullname: "Bander Alshammari",
             username: "bannder_123456",
             phoneNumber: 966542652274)

    ]
    
    public func allUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        completion(.success(self.users))
    }
    
    public func save(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        self.users.append(user)
        completion(.success(user))
    }
}
