import Vapor
import Repository
import Fluent
import FluentSQLiteDriver

/// Called before your application initializes.
public func configure(_ app: Application) throws {

    // Configure a SQLite database
    let workingDir = DirectoryConfiguration.detect().workingDirectory
    let sqliteConfig = SQLiteConfiguration(storage: .file(path: "\(workingDir)wallet.db"))
    print(workingDir)
    app.databases.use(.sqlite(sqliteConfig), as: .sqlite)
    app.migrations.add(CreateUserMigration())
    
    // Register routes to the router
    try routes(app)

}
