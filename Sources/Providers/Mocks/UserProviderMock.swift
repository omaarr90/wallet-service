//
//  UserProviderMock.swift
//  Providers
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Entities
import UseCases

public class UserProviderMock: UserProvider {
    
    public init() {}

    private let users = [
        User(fullname: "Omar Alshammari",
             username: "omar_123456",
             phoneNumber: 966542652273),
        User(fullname: "Bander Alshammari",
             username: "bannder_123456",
             phoneNumber: 966542652274)

    ]
    
    public func allUsers() -> [User] {
        return users
    }
}
