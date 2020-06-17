import Foundation
import Fluent
import FluentSQLiteDriver

final class UserModel: Model {
    static let schema: String = "tbl_users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "fullname")
    var fullname: String

    @Field(key: "username")
    var username: String

    @Field(key: "phone_number")
    var phoneNumber: Int64
    
    init() {}

    init(id: UUID?, fullname: String, username: String, phoneNumber: Int64) {
        self.id = id
        self.fullname = fullname
        self.username = username
        self.phoneNumber = phoneNumber
    }
}