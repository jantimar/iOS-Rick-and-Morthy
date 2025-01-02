// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DatabaseService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DatabaseService",
            targets: ["DatabaseService"])
    ],
    dependencies: [
        .package(name: "Models", path: "../Models")
    ],
    targets: [
        .target(
            name: "DatabaseService",
            dependencies: ["Models"]),
        .testTarget(
            name: "DatabaseServiceTests",
            dependencies: ["DatabaseService"]
        )
    ]
)
