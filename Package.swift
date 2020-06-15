// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "wallet-service",
    products: [
        .library(name: "wallet-service", targets: ["RestApi"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        
        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
        
        
        // Lightweight full-featured Promises, Async & Await Library in Swift.
        .package(url: "https://github.com/malcommac/Hydra.git", from: "2.0.0")
    ],
    targets: [
        .target(name: "Domain"),
        .target(name: "Utilties"),
        .target(name: "Application", dependencies: ["Domain", "Utilties", "Hydra"]),
        .target(name: "Persistance", dependencies: ["Domain", "Utilties", "Application", "Hydra"]),
        .target(name: "RestApi", dependencies: ["FluentSQLite", "Vapor", "Application", "Utilties", "Persistance"]),
        .target(name: "Run", dependencies: ["RestApi"]),
        .testTarget(name: "DomainTests", dependencies: ["Domain"]),
        .testTarget(name: "UtiltiesTests", dependencies: ["Utilties"]),
        .testTarget(name: "ApplicationTests", dependencies: ["Application", "Persistance"]),
        .testTarget(name: "PersistanceTests", dependencies: ["Persistance"]),
        .testTarget(name: "RestApiTests", dependencies: ["RestApi"])
    ]
)

