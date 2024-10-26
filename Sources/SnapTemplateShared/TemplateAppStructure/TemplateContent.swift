//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
	
public struct TemplateContent<NavigationProvider: SnapNavigationProvider>: View {
	
	private let navigator: SnapNavigation.Navigator<NavigationProvider>
	private let settingsScreen: NavigationProvider.Screen
	
	public init(provider: NavigationProvider, settingsScreen: NavigationProvider.Screen) {
		self.navigator = SnapNavigation.Navigator(provider: provider)
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
		
	}
	
}
