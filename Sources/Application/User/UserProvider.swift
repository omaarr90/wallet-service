//
//  UserProvider.swift
//  UseCases
//
//  Created by Omar Alshammari on 19/10/1441 AH.
//

import Foundation
import Entities

public protocol UserProvider {
    func allUsers() -> [Entities.User]
    func save(user: Entities.User) -> Bool
}
