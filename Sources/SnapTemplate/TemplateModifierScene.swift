//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SwiftUI

public struct TemplateModifierScene<Destination: SnapNavigationDestination, SidebarModifier: ViewModifier> : ViewModifier {

	@Dependency(\.templateState) private var templateState: TemplateState
	
	private let scene: SnapNavigation.NavigationScene<Destination>
	private let sidebarModifier: SidebarModifier
	
	public init(scene: SnapNavigation.NavigationScene<Destination>, sidebarModifier: SidebarModifier) {
		self.scene = scene
		self.sidebarModifier = sidebarModifier
	}
	
	public func body(content: Content) -> some View {
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
