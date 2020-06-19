import Foundation
import Domain
import Application
//import Hydra

public class EmptyUserRepositoryMock: UserRepository {
    
    private var users: [User] = []

    public init() {}
    
    public func allUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        completion(.success([]))
    }
    
    public func save(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        self.users.append(user)
        completion(.success(user))
    }
    
    public func findUser(by phoneNumber: Int64, completion: @escaping (Result<User, Error>) -> Void) {
        completion(.failure(RepositoryError.notFound))
    }

}

