// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cloud-config-swift",
    platforms: [
      .iOS(.v13),
      .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "cloud-config-swift",
            targets: ["cloud-config-swift"]),
    ],
    dependencies: [
      .package(name: "JSON", url: "https://github.com/dankogai/swift-json.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "cloud-config-swift",
            dependencies: ["JSON"]),
        .testTarget(
            name: "cloud-config-swiftTests",
            dependencies: ["cloud-config-swift"]),
    ]
)
