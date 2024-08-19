//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

/// A wrapper around NavigationSplitView to expose isCollapsed.
public struct SnapNavigationSplitView<Sidebar, Content, Detail>: View where Sidebar : View, Content : View, Detail : View {
	
	@Environment(\.horizontalSizeClass) private var horizontalSizeClass
	// TODO FB13203611: This should come as a binding of NavigationSplitView.
//	private var isCollapsed: Bool { horizontalSizeClass == .compact }
	
	public init(columnVisibility: Binding<NavigationSplitViewVisibility>, preferredCompactColumn: Binding<NavigationSplitViewColumn>, isCollapsed: Binding<Bool>, @ViewBuilder sidebar: @escaping () -> Sidebar, @ViewBuilder detail: @escaping () -> Detail) where Content == EmptyView {
		self.columnVisibility = columnVisibility
		self.preferredCompactColumn = preferredCompactColumn
		self.isCollapsed = isCollapsed
		self.sidebar = sidebar
		self.content = nil
		self.detail = detail
	}
	
	public init(columnVisibility: Binding<NavigationSplitViewVisibility>, preferredCompactColumn: Binding<NavigationSplitViewColumn>, isCollapsed: Binding<Bool>, @ViewBuilder sidebar: @escaping () -> Sidebar, @ViewBuilder content: @escaping () -> Content, @ViewBuilder detail: @escaping () -> Detail) {
		self.columnVisibility = columnVisibility
		self.preferredCompactColumn = preferredCompactColumn
		self.isCollapsed = isCollapsed
		self.sidebar = sidebar
		self.content = content
		self.detail = detail
	}
	
	private let columnVisibility: Binding<NavigationSplitViewVisibility>
	private let preferredCompactColumn: Binding<NavigationSplitViewColumn>
	private let isCollapsed: Binding<Bool>
	private let sidebar: () -> Sidebar
	private let content: (() -> Content)?
	private let detail: () -> Detail
	
	public var body: some View {
		Group {
			if let content {
				NavigationSplitView(columnVisibility: columnVisibility, preferredCompactColumn: preferredCompactColumn, sidebar: sidebar, content: content, detail: detail)
			} else {
				NavigationSplitView(columnVisibility: columnVisibility, preferredCompactColumn: preferredCompactColumn, sidebar: sidebar, detail: detail)
			}
		}
		.onChange(of: horizontalSizeClass, initial: true) { oldValue, newValue in
			isCollapsed.wrappedValue = newValue == .compact
		}
	}
	
}
