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
    dependencies: [
        .package(name: "Models", path: "Models"),
        .package(name: "Utils", path: "Utils")
    ],
    targets: [
        .target(
            name: "DTO",
            dependencies: ["Models", "Utils"]),
        .testTarget(
            name: "DTOTests",
            dependencies: ["DTO", "Models", "Utils"]
        ),
    ]
)
