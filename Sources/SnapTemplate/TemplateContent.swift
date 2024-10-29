//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SwiftUI
	
public struct TemplateContent<NavigationProvider: SnapNavigationProvider>: View {
	
	typealias Navigator = SnapNavigation.Navigator<NavigationProvider>
	
	@Dependency private var navigator: Navigator
	@Dependency private var navigatorTemplateSettings: TemplateSettingsNavigator
	@Dependency private var templateState: TemplateState
	
	public init() {}
	
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
