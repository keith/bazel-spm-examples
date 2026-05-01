// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "bazel-spm-examples",
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
        .package(url: "https://github.com/apple/swift-async-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-crypto", from: "3.7.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.6.0"),
        .package(url: "https://github.com/apple/swift-nio", from: "2.70.0"),
        .package(url: "https://github.com/swiftlang/swift-syntax", from: "601.0.0"),

        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.15.0"),
        .package(url: "https://github.com/pointfreeco/swift-perception", from: "1.3.0"),

        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.11.0"),
        .package(url: "https://github.com/braintree/braintree_ios", from: "7.5.0"),
        .package(url: "https://github.com/google/GoogleAppMeasurement", from: "12.12.0"),
        .package(url: "https://github.com/Mitek-Systems/MiSnap-iOS", from: "5.9.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.7.0"),
    ]
)
