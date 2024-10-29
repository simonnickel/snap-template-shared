// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "snap-template",
	platforms: [
		.iOS(.v18), .macOS(.v15)
	],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SnapTemplate",
            targets: ["SnapTemplate", "SnapTemplateSettings"]
		),
    ],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		.package(url: "https://github.com/simonnickel/snap-core.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-dependencies.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-navigation.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-settings-service.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-theme.git", branch: "main"),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "SnapTemplate",
			dependencies: [
				"SnapTemplateSettings",
				.product(name: "SnapCore", package: "snap-core"),
				.product(name: "SnapDependencies", package: "snap-dependencies"),
				.product(name: "SnapNavigation", package: "snap-navigation"),
				.product(name: "SnapSettingsService", package: "snap-settings-service"),
				.product(name: "SnapTheme", package: "snap-theme"),
			]
		),
		.target(
			name: "SnapTemplateSettings",
			dependencies: [
				.product(name: "SnapCore", package: "snap-core"),
				.product(name: "SnapDependencies", package: "snap-dependencies"),
				.product(name: "SnapNavigation", package: "snap-navigation"),
				.product(name: "SnapSettingsService", package: "snap-settings-service"),
				.product(name: "SnapTheme", package: "snap-theme"),
			]
		),
    ],
    swiftLanguageModes: [.version("6")]
)
