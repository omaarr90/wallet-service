import Foundation

public struct User {
    let fullname: String
    let username: String
    let phoneNumber: Int
    
    public init(fullname: String, username: String, phoneNumber: Int) {
        self.fullname = fullname
        self.username = username
        self.phoneNumber = phoneNumber
    }
}
