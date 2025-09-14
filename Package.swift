// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let filename = "wg-go.xcframework.zip"
let version = "0.0.2025063101"
let checksum = "b0c6b18d2008724cd35c84839fdb64cfb195ba23d5e8b0233de5ab5ec866622a"

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
