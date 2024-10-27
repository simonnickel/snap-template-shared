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
	@Dependency private var templateState: TemplateState
	
	private let settingsScreen: NavigationProvider.Screen
	
	public init(settingsScreen: NavigationProvider.Screen) {
		self.settingsScreen = settingsScreen
	}
	
	public var body: some View {
		
		SnapNavigationView(
			navigator: navigator
		)
#if !os(macOS) // macOS settings are available in the application menu.
		.tabViewSidebarBottomBar {
			HStack {
				ToolbarButtonSettings {
					navigator.present(screen: settingsScreen, style: .modal)
				}
				Spacer()
			}
		}
#endif
		.theme(apply: templateState.theme) // TODO: Check if updates are propagated.
		.preferredColorScheme(templateState.displayMode?.colorScheme)
		
	}
	
}
