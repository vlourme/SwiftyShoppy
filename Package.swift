// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SwiftyShoppy",
    products: [
        .library(
            name: "SwiftyShoppy",
            targets: ["SwiftyShoppy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0"))
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
