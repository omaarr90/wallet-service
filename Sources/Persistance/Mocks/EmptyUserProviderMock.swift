import Foundation
import Domain
import Application
import Hydra

public class EmptyUserProviderMock: UserProvider {
    
    private var users: [User] = []

    public init() {}
    
    public func allUsers() -> Promise<[User]> {
        return Promise<[User]> { resolver, rejecter, status in
            resolver([])
        }
    }
    
    public func save(user: User) -> Promise<User> {
        return Promise<User> { resolver, rejjecter, status in
            self.users.append(user)
            resolver(user)
        }
    }
}

