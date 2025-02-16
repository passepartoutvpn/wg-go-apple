// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let filename = "wg-go.xcframework.zip"
let version = "0.0.20240714"
let checksum = "4c2a63b15e73a966260ba86d2c95eefdf0697843252e83bc4960babece04eabf"

let package = Package(
    name: "wg-go-apple",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "wg-go-apple",
            targets: ["wg-go"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "wg-go",
            url: "https://github.com/passepartoutvpn/wg-go-apple/releases/download/\(version)/\(filename)",
            checksum: checksum
        )

//        // local development
//        .binaryTarget(
//            name: "wg-go",
//            path: "build/wg-go.xcframework.zip"
//        )
    ]
)
