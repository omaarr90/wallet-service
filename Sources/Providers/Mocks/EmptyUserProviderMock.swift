import Foundation
import Entities
import UseCases

public struct EmptyUserProviderMock: UserProvider {
    
    public init() {}
    
    public func allUsers() -> [User] {
        return []
    }
    
}

