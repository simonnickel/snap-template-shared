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
	
	private let settingsDestination: NavigationProvider.Destination
	
	public init(settingsDestination: NavigationProvider.Destination) {
		self.settingsDestination = settingsDestination
	}
	
	public var body: some View {
		
		SnapNavigationView(
			navigator: navigator
		)
#if !os(macOS) // macOS settings are available in the application menu.
		.tabViewSidebarBottomBar {
			HStack {
				ToolbarButtonSettings {
					// TODO: Should work like this. SnapNavigation does not allow it yet though.
//					navigator.navigate(to: settingsDestination)
					navigator.present(destination: settingsDestination, style: .modal)
				}
				Spacer()
			}
		}
#endif
		.theme(apply: templateState.theme) // TODO: Check if updates are propagated.
		.preferredColorScheme(templateState.displayMode?.colorScheme)
		
	}
	
}
