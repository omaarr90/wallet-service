//
//  UserProvider.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain
import Hydra

public protocol UserProvider {
    func allUsers() -> Promise<[User]>
    func save(user: Domain.User) -> Promise<User>
}
