// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "wallet-service",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "wallet-service", targets: ["VaporApp"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        
        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
//        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
        
        
        // Lightweight full-featured Promises, Async & Await Library in Swift.
//        .package(url: "https://github.com/malcommac/Hydra.git", from: "2.0.0")
    ],
    targets: [
        .target(name: "Domain"),
        .target(name: "Utilties"),
        .target(name: "Application",
                dependencies: [.target(name: "Domain"),
                               .target(name: "Utilties"),
//                               .product(name: "Hydra", package: "Hydra")
        ]),
        .target(name: "Repository",
                dependencies: [.target(name: "Domain"),
                               .target(name: "Utilties"),
                               .target(name: "Application"),
//                               .product(name: "Hydra", package: "Hydra")
        ]),
        .target(name: "VaporApp",
                dependencies: [.product(name: "Vapor", package: "vapor"),
                               .target(name: "Application"),
                               .target(name: "Utilties"),
                               .target(name: "Repository")
        ]),
        .target(name: "Run",
                dependencies: [.target(name: "VaporApp")
        ]),
        
        // Tests
        .testTarget(name: "DomainTests",
                    dependencies: [.target(name: "Domain")]),
        .testTarget(name: "UtiltiesTests",
                    dependencies: [.target(name: "Utilties")]),
        .testTarget(name: "ApplicationTests",
                    dependencies: [.target(name: "Application"),
                                   .target(name: "Repository")]),
        .testTarget(name: "RepositoryTests",
                    dependencies: [.target(name: "Repository")]),
        .testTarget(name: "VaporAppTests",
                    dependencies: [.target(name: "VaporApp")])
    ]
)

