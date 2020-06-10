import Foundation
import Entities
import UseCases

struct EmptyUserProviderMock: UserProvider {
    func allUsers() -> [User] {
        return []
    }
    
}

