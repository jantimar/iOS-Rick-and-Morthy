// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Organisms",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Organisms",
            targets: ["Organisms"])
    ],
    dependencies: [
        .package(name: "Style", path: "Style"),
        .package(name: "Molecules", path: "Molecules"),
        .package(name: "Atoms", path: "Atoms")
    ],
    targets: [
        .target(
            name: "Organisms",
            dependencies: ["Style", "Atoms", "Molecules"])
    ]
)
