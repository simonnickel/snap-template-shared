//
//  SettingsRow.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 25.10.23.
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
