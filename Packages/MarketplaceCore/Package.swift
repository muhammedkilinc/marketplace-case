// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "MarketplaceCore",
                      platforms: [.iOS(.v16)],
                      products: [// Products define the executables and libraries a package produces, making them visible to other packages.
                        .library(name: "MarketplaceCore",
                                 targets: ["MarketplaceCore"])],
                      dependencies: [.package(name: "Network", path: "../Network"),
                                     .package(name: "Localization", path: "../Localization")],
                      targets: [// Targets are the basic building blocks of a package, defining a module or a test suite.
                        // Targets can depend on other targets in this package and products from dependencies.
                        .target(name: "MarketplaceCore",
                                dependencies: [.product(name: "Network", package: "Network"),
                                               .product(name: "Localization", package: "Localization")]),
                        .testTarget(name: "MarketplaceCoreTests",
                                    dependencies: ["MarketplaceCore"])])
