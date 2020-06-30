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


        // 🔵 Swift ORM (queries, models, relations, etc)
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0-rc.2"),


        // Lightweight full-featured Promises, Async & Await Library in Swift.
        //        .package(url: "https://github.com/malcommac/Hydra.git", from: "2.0.0")

        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.0.0"),
        .package(url: "https://github.com/lachlanbell/SwiftOTP.git", from: "2.0.1")
        // included by  SwiftOTP      .package(url: "https://github.com/norio-nomura/Base32.git", from: "0.8.0")
    ],
    //product(name: "Crypto", package: "swift-crypto")
    targets: [
        .target(name: "Lib",
                dependencies: [.product(name: "CryptoSwift", package: "CryptoSwift"), 
                               .product(name: "SwiftOTP", package: "SwiftOTP"), 
        ]),
        .target(name: "Domain"),
        .target(name: "Utilties",
                dependencies: [.product(name: "Vapor", package: "vapor"),
        ]),

        .target(name: "Application",
                dependencies: [.target(name: "Domain"),
                               .target(name: "Utilties"),
                               .product(name: "SwiftOTP", package: "SwiftOTP")
                               //                               .product(name: "Hydra", package: "Hydra")
        ]),
        .target(name: "Repository",
                dependencies: [.target(name: "Domain"),
                               .target(name: "Utilties"),
                               .target(name: "Application"),
                               .product(name: "Fluent", package: "fluent"),
                               .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver")
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
        .testTarget(name: "LibTests",
                dependencies: [.target(name: "Lib")]),
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
                    dependencies: [.target(name: "VaporApp"),
                                   .product(name: "XCTVapor", package: "vapor")])
    ]
)

