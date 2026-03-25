// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-color",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Color",
            targets: ["Color"]
        )
    ],
    dependencies: [
        .package(path: "../../swift-standards/swift-color-standard"),
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
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
