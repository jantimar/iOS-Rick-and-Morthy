// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APIService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "APIService",
            targets: ["APIService"])
    ],
    dependencies: [
        .package(name: "DTO", path: "../DTO"),
        .package(name: "Utils", path: "../Utils")
    ],
    targets: [
        .target(
            name: "APIService",
            dependencies: ["DTO", "Utils"]),
        .testTarget(
            name: "APIServiceTests",
            dependencies: ["APIService"]
        )
    ]
)
