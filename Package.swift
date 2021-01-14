// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlamofireXMLRPC",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_11),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.1")),
        .package(url: "https://github.com/tadija/AEXML.git", .upToNextMajor(from: "4.6.0")),
    ],
    targets: [
        .target(
            name: "AlamofireXMLRPC",
            dependencies: ["Alamofire", "AEXML"],
            path: "Sources/AlamofireXMLRPC"
        )
    ],
    swiftLanguageVersions: [.v5]
)

