//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation

public protocol TemplateSettingsNavigator {
	
	typealias Destination = TemplateSettingsDestination
	
	@MainActor
	func navigate(to destination: Destination)
	
	@MainActor
	func present(destination: Destination, style styleOverride: SnapNavigation.PresentationStyle?)
	
}
