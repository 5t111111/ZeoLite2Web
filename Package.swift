// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MMDBWebAPI",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.3"),
        .package(url: "https://github.com/5t111111/MaxMind.git", .branch("master"))
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "MaxMind"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
