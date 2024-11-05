//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SwiftUI

public protocol TemplateSettingsNavigator {
	
	typealias Destination = TemplateSettingsDestination
	
	@MainActor
	func navigate(to destination: Destination)
	
	@MainActor
	func present(destination: Destination, style styleOverride: SnapNavigation.PresentationStyle?)
	
}

private struct TemplateSettingsNavigatorEnvironmentGuard: TemplateSettingsNavigator {
	func navigate(to destination: Destination) {
		fatalError("TemplateSettingsNavigator not available.")
	}
	
	func present(destination: Destination, style styleOverride: SnapNavigation.PresentationStyle?) {
		fatalError("TemplateSettingsNavigator not available.")
	}
	
	
}

// MARK: - Environment

public extension EnvironmentValues {
	
	@Entry var navigatorSettings: TemplateSettingsNavigator = TemplateSettingsNavigatorEnvironmentGuard()
	
}
