//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct SettingsRow<Content: View>: View {
	
	private let title: String?
	@ViewBuilder private let content: () -> Content
	
	public init(title: String? = nil, content: @escaping () -> Content) {
		self.title = title
		self.content = content
	}
	
	public var body: some View {
#if os(macOS)
		
		content()
			.themeListRow()
		
#else
		
		VStack(alignment: .leading) {
			
			if let title {			
				ThemeLabel(text: title)
					.theme(text: .listTitle)
			}
			
			content()
			
		}
		.themeListRow()
		
#endif
	}
	
}
