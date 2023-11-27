// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "CommonUI",
                      platforms: [.iOS(.v16)],
                      products: [// Products define the executables and libraries a package produces, making them visible to other packages.
                        .library(name: "CommonUI",
                                 targets: ["CommonUI"])],
                      dependencies: [.package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
                                     .package(name: "DesignSystem", path: "../DesignSystem")],
                      targets: [// Targets are the basic building blocks of a package, defining a module or a test suite.
                        // Targets can depend on other targets in this package and products from dependencies.
                        .target(name: "CommonUI",
                                dependencies: [.product(name: "Kingfisher", package: "Kingfisher"),
                                               .product(name: "DesignSystem", package: "DesignSystem")]),
                        .testTarget(name: "CommonUITests",
                                    dependencies: ["CommonUI"])])
