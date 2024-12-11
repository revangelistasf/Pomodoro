// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Main",
	platforms: [
		.iOS(.v16)
	],
    products: [
		.singleTargetLibrary("AppFeature")
    ],
	dependencies: [
		.package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", exact: "1.9.0")
	],
    targets: [
        .target(
			name: "AppFeature",
			dependencies: [
				"SharedModels"
			]
		),
		.target(
			name: "SharedModels"
		)
    ]
)

extension Product {
	static func singleTargetLibrary(_ name: String) -> Product {
		.library(name: name, targets: [name])
	}
}
