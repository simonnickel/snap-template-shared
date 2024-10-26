//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
	
public struct TemplateContent<NavigationProvider: SnapNavigationProvider>: View {
	
	private let provider: NavigationProvider
	
	public init(provider: NavigationProvider) {
		self.provider = provider
	}
	
	public var body: some View {
		
		SnapNavigationView(
			provider: provider
		)
#if !os(macOS) // macOS settings are available in the application menu.
		.tabViewSidebarBottomBar {
			HStack {
				// TODO: Needs to be inside of SnapNavigationView to have access to Navigator.
//				ToolbarButtonSettings {
//					navigator.present(screen: .settings)
//				}
				Spacer()
			}
		}
#endif
		
	}
	
}
