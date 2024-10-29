//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct ThemeSceneSettings<Content>: View where Content : View {
	
	@Environment(\.theme) private var theme
	
	public init(
		title: String? = nil,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.title = title
		self.content = content
	}
	
	private let title: String?
	private let content: () -> Content
	
	public var body: some View {
		
#if !os(macOS)
		ThemeScreenList(title: title, titleMode: .inline, listStyle: .insetGrouped, content: content)
#else
		ThemeScreenSidebar(title: title, collapsed: false, content: content)
#endif

	}
	
}
