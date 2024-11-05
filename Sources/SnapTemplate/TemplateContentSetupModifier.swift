//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SwiftUI

public extension View {
	
	func setupTemplateConfig<Destination: SnapNavigationDestination, SidebarModifier: ViewModifier>(
		for scene: SnapNavigation.NavigationScene<Destination>,
		sidebarModifier: SidebarModifier
	) -> some View {
		modifier(TemplateContentSetupModifier<Destination, SidebarModifier>(scene: scene, sidebarModifier: sidebarModifier))
	}
	
}

internal struct TemplateContentSetupModifier<Destination: SnapNavigationDestination, SidebarModifier: ViewModifier> : ViewModifier {

	@Dependency(\.templateState) private var templateState: TemplateState
	
	let scene: SnapNavigation.NavigationScene<Destination>
	let sidebarModifier: SidebarModifier
	
	internal func body(content: Content) -> some View {
		content
			.navigationStyle(scene == .main ? .tabsAdaptable : nil) // TODO: Style from settings
			.theme(apply: templateState.theme) // TODO: Check if updates are propagated.
			.preferredColorScheme(templateState.displayMode?.colorScheme)
#if !os(macOS) // macOS settings are available in the application menu.
			.tabViewSidebarBottomBar {
				HStack {
					ToolbarButtonSettings()
					Spacer()
				}
				.modifier(sidebarModifier)
			}
#endif
	}
	
}
