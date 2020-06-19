import Foundation

public struct User {
    public let fullname: String
    public let username: String
    public let phoneNumber: Int64
    public let isVerified: Bool
    public let password: String?
    
    public init(fullname: String, username: String, phoneNumber: Int64, isVerified: Bool, password: String? = nil) {
        self.fullname = fullname
        self.username = username
        self.phoneNumber = phoneNumber
        self.isVerified = isVerified
        self.password = password
    }
}
