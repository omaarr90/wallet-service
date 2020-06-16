import Foundation

public struct User {
    public let fullname: String
    public let username: String
    public let phoneNumber: Int64
    
    public init(fullname: String, username: String, phoneNumber: Int64) {
        self.fullname = fullname
        self.username = username
        self.phoneNumber = phoneNumber
    }
}
