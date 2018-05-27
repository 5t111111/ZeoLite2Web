// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "ZeoLite2Web",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.3"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc.2.2"),
        .package(url: "https://github.com/5t111111/ZeoLite2.git", from: "1.0.0"),
        .package(url: "https://github.com/GraphQLSwift/GraphQL.git", from: "0.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "Leaf", "ZeoLite2", "GraphQL"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
