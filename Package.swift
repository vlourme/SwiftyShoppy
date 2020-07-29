// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftyShoppy",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v5)
    ],
    products: [
        .library(
            name: "SwiftyShoppy",
            targets: ["SwiftyShoppy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0"))
        .package(url: "https://github.com/marksands/BetterCodable", .upToNextMajor(from: "0.1.0"))
    ],
    targets: [
        .target(
            name: "SwiftyShoppy",
            dependencies: ["Moya"],
            path: "SwiftyShoppy"
        ),
        .testTarget(
            name: "SwiftyShoppyTests",
            dependencies: ["SwiftyShoppy"]),
    ]
)
