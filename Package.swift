// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUINavigationRouter",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SwiftUINavigationRouter",
            targets: ["SwiftUINavigationRouter"]),
    ],
    targets: [
        .target(
            name: "SwiftUINavigationRouter"),
        .testTarget(
            name: "SwiftUINavigationRouterTests",
            dependencies: ["SwiftUINavigationRouter"]
        ),
    ]
)
