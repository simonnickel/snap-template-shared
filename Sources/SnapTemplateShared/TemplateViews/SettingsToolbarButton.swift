//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct ToolbarButtonSettings: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	public init() { }
	
	public var body: some View {
		
		Button {
			templateStateBinding.showSettings.wrappedValue.toggle()
		} label: {
			ThemeLabel(
				text: "Settings",
				icon: .settings
			)
		}

	}
	
}
