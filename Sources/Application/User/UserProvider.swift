//
//  UserProvider.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain

public protocol UserProvider {
    func allUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func save(user: Domain.User, completion: @escaping (Result<User, Error>) -> Void)
}
