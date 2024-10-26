// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "snap-template-shared",
	platforms: [
		.iOS(.v18), .macOS(.v15)
	],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SnapTemplateShared",
            targets: ["SnapTemplateShared"]
		),
    ],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		.package(url: "https://github.com/simonnickel/snap-core.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-theme.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-settings-service.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-navigation.git", branch: "main"),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "SnapTemplateShared",
			dependencies: [
				.product(name: "SnapCore", package: "snap-core"),
				.product(name: "SnapTheme", package: "snap-theme"),
				.product(name: "SnapSettingsService", package: "snap-settings-service"),
				.product(name: "SnapNavigation", package: "snap-navigation"),
			]
		),
    ],
    swiftLanguageModes: [.version("6")]
)
