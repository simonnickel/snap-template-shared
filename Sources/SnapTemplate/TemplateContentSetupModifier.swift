//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SwiftUI

public extension View {
	
	func setupTemplateConfig<Destination: SnapNavigationDestination>(for scene: SnapNavigation.NavigationScene<Destination>) -> some View {
		modifier(TemplateContentSetupModifier<Destination>(scene: scene))
	}
	
}

internal struct TemplateContentSetupModifier<Destination: SnapNavigationDestination> : ViewModifier {

	@Dependency(\.templateState) private var templateState: TemplateState
	
	let scene: SnapNavigation.NavigationScene<Destination>
	
	internal func body(content: Content) -> some View {
		content
			.navigationStyle(scene == .main ? .tabsAdaptable : nil) // TODO: Style from settings
			.theme(apply: templateState.theme) // TODO: Check if updates are propagated.
			.preferredColorScheme(templateState.displayMode?.colorScheme)
	}
	
}
