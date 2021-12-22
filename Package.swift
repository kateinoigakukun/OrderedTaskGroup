// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "OrderedTaskGroup",
    products: [
        .library(
            name: "OrderedTaskGroup",
            targets: ["OrderedTaskGroup"]),
    ],
    targets: [
        .target(
            name: "OrderedTaskGroup",
            dependencies: []),
        .testTarget(
            name: "OrderedTaskGroupTests",
            dependencies: ["OrderedTaskGroup"]),
    ]
)
