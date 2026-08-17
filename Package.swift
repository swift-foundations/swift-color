// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-color",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27")
    ],
    products: [
        .library(
            name: "Color",
            targets: ["Color"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-color-standard.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Color",
            dependencies: [
                .product(name: "Color Standard", package: "swift-color-standard"),
                .product(name: "Theme", package: "swift-color-standard"),
            ]
        ),
        .testTarget(
            name: "Color Tests",
            dependencies: [
                "Color",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
