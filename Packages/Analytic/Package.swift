// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "Analytic",
                      platforms: [.iOS(.v16)],
                      products: [// Products define the executables and libraries a package produces, making them visible to other packages.
                        .library(name: "Analytic",
                                 targets: ["Analytic"])],
                      dependencies: [.package(url: "https://github.com/firebase/firebase-ios-sdk",
                                              .upToNextMajor(from: "10.18.0"))],
                      targets: [// Targets are the basic building blocks of a package, defining a module or a test suite.
                        // Targets can depend on other targets in this package and products from dependencies.
                        .target(name: "Analytic",
                                dependencies: [.product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                                               .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk")])])
