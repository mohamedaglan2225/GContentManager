// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GContentManager",
    platforms: [.iOS(.v13),],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GContentManager",
            targets: ["GContentManager"]),
    ],
//    dependencies: [
//        .package(url: "https://github.com/Qyoom-Company/PasscodeLock", from: "1.0.0"),
//        .package(url: "https://github.com/Qyoom-Company/HammelNewUIKit", from: "1.0.0"),
//        .package(url: "https://github.com/mohamedaglan2225/GColorPalet.git", revision: "74de6c08b36824c524207ac79131fcbc69f6168c"),
//    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GContentManager"),
        .testTarget(
            name: "GContentManagerTests",
            dependencies: ["GContentManager"]),
    ]
)
