//
//  ThemeSceneSettings.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 01.11.23.
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
		ThemeSceneList(title: title, titleMode: .inline, listStyle: .insetGrouped, content: content)
#else
		ThemeSceneSidebar(title: title, collapsed: false, content: content)
#endif

	}
	
}
