//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapDependencies
import SnapNavigation
import SnapTheme

public struct ToolbarButtonSettings: View {
	
	@Environment(Navigator.self) private var navigator

	public init() {}
	
	public var body: some View {
		
		Button {
			navigator.present(destination: TemplateSettingsDestination.screen)
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
