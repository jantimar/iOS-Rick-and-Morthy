// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Atoms",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Atoms",
            targets: ["Atoms"]),
    ],
    dependencies: [
        .package(name: "Style", path: "Style")
    ],
    targets: [
        .target(
            name: "Atoms",
            dependencies: ["Style"]),
    ]
)
