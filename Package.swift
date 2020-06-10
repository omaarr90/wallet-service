// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "wallet-service",
    products: [
        .library(name: "wallet-service", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "Entities"),
        .target(name: "Utilties"),
        .target(name: "UseCases", dependencies: ["Entities", "Utilties"]),
        .target(name: "Providers", dependencies: ["Entities", "Utilties", "UseCases"]),
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor", "UseCases", "Utilties", "Providers"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "EntitiesTests", dependencies: ["Entities"]),
        .testTarget(name: "UtiltiesTests", dependencies: ["Utilties"]),
        .testTarget(name: "UseCasesTests", dependencies: ["UseCases", "Providers"]),
        .testTarget(name: "ProvidersTests", dependencies: ["Providers"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

