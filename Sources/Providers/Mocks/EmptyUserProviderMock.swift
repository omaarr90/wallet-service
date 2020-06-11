import Foundation
import Entities
import UseCases

public class EmptyUserProviderMock: UserProvider {
    
    private var users: [User] = []

    public init() {}
    
    public func allUsers() -> [User] {
        return []
    }
    
    public func save(user: User) -> Bool {
        users.append(user)
        return true
    }
}

