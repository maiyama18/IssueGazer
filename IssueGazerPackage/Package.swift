// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IssueGazerPackage",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "QueriesFeature",
                "SettingsFeature",
                "Resources",
            ]),
        .target(
            name: "QueriesFeature",
            dependencies: [
                "Extensions",
                "Resources",
            ]),
        .target(
            name: "SettingsFeature",
            dependencies: [
                "Extensions",
                "Resources",
            ]),
        .target(
            name: "Extensions",
            dependencies: []),
        .target(
            name: "Resources",
            dependencies: []),
    ]
)
