//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapDependencies
import SnapTheme
	
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
				ToolbarButtonSettings {
					// TODO: Should work like this. SnapNavigation does not allow it yet though.
//					navigatorTemplateSettings.present(destination: .screen)
					navigatorTemplateSettings.present(destination: .screen, style: .modal)
				}
				Spacer()
			}
		}
#endif
		.theme(apply: templateState.theme) // TODO: Check if updates are propagated.
		.preferredColorScheme(templateState.displayMode?.colorScheme)
		
	}
	
}
