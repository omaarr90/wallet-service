//
//  DependencyInjectionProvider.swift
//  VaporApp
//
//  Created by عمر سعيد الشمري on 18/06/2020.
//

import Vapor
import Application
import Repository

final class DependencyInjectionProvider {
    
    private let app: Vapor.Application
    
    init(app: Vapor.Application) {
        self.app = app
    }
    
    var userRepo: UserRepository {
        switch app.environment {
        case .testing:
            return UserRepositoryMock()
        default:
            return FluentUserRepo(database: app.db)
        }
    }
}
