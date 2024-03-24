// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "wg-go-apple",
    products: [
        .library(
            name: "wg-go-apple",
            targets: ["wg-go"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "wg-go",
            url: "https://github.com/passepartoutvpn/wg-go-apple/releases/download/1.0.2004/wg-go.xcframework.zip",
            checksum: "91eee47e6e38587b4367654124ccc433caa42c8568800a058383ce65ffcb88ba"
        )

//        // local development
//        .binaryTarget(
//            name: "wg-go",
//            path: "build/wg-go.xcframework.zip"
//        )
    ]
)
