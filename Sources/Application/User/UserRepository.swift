//
//  UserProvider.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain

public enum RepositoryError: Error {
    case notFound
}

public protocol UserRepository {
    func allUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func save(user: Domain.User,
              completion: @escaping (Result<User, Error>) -> Void)
    func findUser(by phoneNumber: Int64,
                  completion: @escaping (Result<User, Error>) -> Void)
    func saveUserPassword(phoneNumber: Int64,
                          password: String,
                          completion: @escaping (Result<Void, Error>) -> Void)
}
