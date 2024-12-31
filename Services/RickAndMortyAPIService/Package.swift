// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RickAndMortyAPIService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "RickAndMortyAPIService",
            targets: ["RickAndMortyAPIService"]),
    ],
    dependencies: [
        .package(name: "Models", path: "../Models"),
        .package(name: "DTO", path: "../DTO"),
        .package(name: "APIService", path: "APIService")
    ],
    targets: [
        .target(
            name: "RickAndMortyAPIService",
            dependencies: ["Models", "DTO", "APIService"]),
        .testTarget(
            name: "RickAndMortyAPIServiceTests",
            dependencies: ["RickAndMortyAPIService", "Models", "DTO", "APIService"]
        ),
    ]
)
