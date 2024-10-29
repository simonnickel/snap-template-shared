//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapDependencies

public struct ToolbarButtonSettings: View {
	
	@Dependency private var navigator: TemplateSettingsNavigator
	
	public init() {}
	
	public var body: some View {
		
		Button {
			// TODO: Should work like this. SnapNavigation does not allow it yet though.
//					navigator.present(destination: .screen)
			navigator.present(destination: .screen, style: .modal)
		} label: {
			ThemeLabel(
				text: "Settings",
				icon: .settings
			)
		}
		.buttonStyle(.themeSidebarBottom)
		.theme(padding: .spacingSections, .horizontal)

	}
	
}
