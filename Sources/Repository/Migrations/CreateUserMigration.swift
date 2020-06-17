import Fluent

public struct CreateUserMigration: Migration {
    
    public init() {}
    
    public func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(UserModel.schema)
            .id()
            .field("fullname", .string)
            .field("username", .string)
            .field("phone_number", .int64)
            .unique(on: "username")
            .unique(on: "phone_number")
            .create()
    }
    
    public func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(UserModel.schema).delete()
    }
    
}
