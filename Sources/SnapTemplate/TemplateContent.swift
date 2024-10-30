//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SwiftUI
	
public struct TemplateContent<Navigator: SnapNavigation.Navigator<NavigationProvider>, NavigationProvider: SnapNavigationProvider>: View {
	
	@Dependency(\.templateState) private var templateState: TemplateState
	
	private let navigator: Navigator
	
	public init(navigator: Navigator) {
		self.navigator = navigator
	}
	
	public var body: some View {
		
		SnapNavigationView(
			navigator: navigator
		)
#if !os(macOS) // macOS settings are available in the application menu.
		.tabViewSidebarBottomBar {
			HStack {
				ToolbarButtonSettings()
				Spacer()
			}
		}
#endif
		.theme(apply: templateState.theme) // TODO: Check if updates are propagated.
		.preferredColorScheme(templateState.displayMode?.colorScheme)
		
	}
	
}
