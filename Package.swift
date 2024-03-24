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
            url: "https://github.com/passepartoutvpn/wg-go-apple/releases/download/1.0.2002/wg-go.xcframework.zip",
            checksum: "1d0f21f8b38c4f169f9e382f6e2daa6c547cef1c22e72d6f76646e610eb7956f"
        )

//        // local development
//        .binaryTarget(
//            name: "wg-go",
//            path: "build/wg-go.xcframework.zip"
//        )
    ]
)
