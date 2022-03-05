// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IssueGazerPackage",
    defaultLocalization: "en",
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: []),
        .target(
            name: "Resources",
            dependencies: []),
    ]
)
