// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Molecules",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Molecules",
            targets: ["Molecules"]),
    ],
    dependencies: [
        .package(name: "Style", path: "Style"),
        .package(name: "Atoms", path: "Atoms")
    ],
    targets: [
        .target(
            name: "Molecules",
            dependencies: ["Style", "Atoms"])
    ]
)
