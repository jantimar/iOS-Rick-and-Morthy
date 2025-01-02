// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Models",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Models",
            targets: ["Models"]),
    ],
    dependencies: [
        .package(name: "Locs", path: "Services/Locs")
    ],
    targets: [
        .target(
            name: "Models",
            dependencies: ["Locs"]),
        .testTarget(
            name: "ModelsTests",
            dependencies: ["Models"]
        ),
    ]
)
