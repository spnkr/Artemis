// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Artemis",
    platforms: [
        .macOS(.v10_10), .iOS(.v8),
    ],
    products: [
        .library(name: "Artemis", targets: ["Artemis"]),
        .executable(name: "Artemis-Generate", targets: ["Artemis-Generate"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Artemis", dependencies: []),
        .target(name: "Artemis-Generate", dependencies: ["Artemis"]),
        .testTarget(name: "ArtemisTests", dependencies: ["Artemis"]),
    ]
)
