// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Templates",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Templates",
            targets: ["Templates"])
    ],
    dependencies: [
        .package(name: "Style", path: "Style"),
        .package(name: "Organisms", path: "Organisms"),
        .package(name: "Molecules", path: "Molecules"),
        .package(name: "Atoms", path: "Atoms")
    ],
    targets: [
        .target(
            name: "Templates",
            dependencies: ["Style", "Atoms", "Molecules", "Organisms"])
    ]
)
