import Foundation

public struct User {
    public let fullname: String
    public let username: String
    public let phoneNumber: Int
    
    public init(fullname: String, username: String, phoneNumber: Int) {
        self.fullname = fullname
        self.username = username
        self.phoneNumber = phoneNumber
    }
}
