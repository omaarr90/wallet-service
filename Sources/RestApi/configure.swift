import Vapor

/// Called before your application initializes.
public func configure(_ app: Application) throws {
    // Register routes to the router
    print(app.environment.name)
    print(app.environment.arguments)
    print(app.environment.commandInput)

    try routes(app)
    // Configure a SQLite database
}
