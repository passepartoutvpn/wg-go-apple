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
            url: "https://github.com/passepartoutvpn/wg-go-apple/releases/download/0.0.613/wg-go.xcframework.zip",
            checksum: "613125fb66ebd6246c1a913ea98c993131a698c4e3251ba5ea8834ac17f9cda8"
        )

//        // local development
//        .binaryTarget(
//            name: "wg-go",
//            path: "build/wg-go.xcframework.zip"
//        )
    ]
)
