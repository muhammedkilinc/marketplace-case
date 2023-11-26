// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "LoginModule",
                      platforms: [.iOS(.v16)],
                      products: [// Products define the executables and libraries a package produces, making them visible to other packages.
                        .library(name: "LoginModule",
                                 targets: ["LoginModule"])],
                      dependencies: [.package(name: "MarketplaceCore", path: "../MarketplaceCore")],
                      targets: [// Targets are the basic building blocks of a package, defining a module or a test suite.
                        // Targets can depend on other targets in this package and products from dependencies.
                        .target(name: "LoginModule",
                                dependencies: [.product(name: "MarketplaceCore", package: "MarketplaceCore")]),
                        .testTarget(name: "LoginModuleTests",
                                    dependencies: ["LoginModule"])])
