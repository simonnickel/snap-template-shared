//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct ToolbarButtonSettings: View {
	
	public typealias Action = () -> Void
	private let action: Action
	
	public init(action: @escaping Action) {
		self.action = action
	}
	
	public var body: some View {
		
		Button {
			action()
		} label: {
			ThemeLabel(
				text: "Settings",
				icon: .settings
			)
		}
		.buttonStyle(.themeSidebarBottom)

	}
	
}
