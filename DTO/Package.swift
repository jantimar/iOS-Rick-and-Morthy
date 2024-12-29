// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DTO",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DTO",
            targets: ["DTO"]),
    ],
    targets: [
        .target(
            name: "DTO"),
        .testTarget(
            name: "DTOTests",
            dependencies: ["DTO"]
        ),
    ]
)
