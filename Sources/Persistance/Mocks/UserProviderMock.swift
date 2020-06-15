//
//  UserProviderMock.swift
//  Providers
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Domain
import Application
import Hydra

public class UserProviderMock: UserProvider {
    
    public init() {}

    private var users = [
        User(fullname: "Omar Alshammari",
             username: "omar_123456",
             phoneNumber: 966542652273),
        User(fullname: "Bander Alshammari",
             username: "bannder_123456",
             phoneNumber: 966542652274)

    ]
    
    public func allUsers() -> Promise<[User]> {
        return Promise<[User]> { resolver, rejecter, status in
            resolver(self.users)
        }
    }
    
    public func save(user: User) -> Promise<User> {
        return Promise<User> { resolver, rejecter, status in
            self.users.append(user)
            resolver(user)
        }
    }
}
