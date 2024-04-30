//
//  NavItemRow.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 30.04.24.
//

import SwiftUI
import SnapTheme

public struct NavItemRow<P>: View where P : Decodable, P : Encodable, P : Hashable {
	
	public init(value: P, title: String?, icon: Theme.IconKey?, inSidebar: Bool, isSelected: Bool) {
		self.value = value
		self.title = title
		self.icon = icon
		self.inSidebar = inSidebar
		self.isSelected = isSelected
	}
	
	let value: P
	let title: String?
	let icon: Theme.IconKey?
	let inSidebar: Bool
	let isSelected: Bool
	
	public var body: some View {
		if inSidebar {
			
			ThemeNavLinkSidebarRow(
				value: value,
				isSelected: isSelected
			){
				ThemeLabel(
					text: title,
					icon: icon
				)
					.labelStyle(.themeSidebar(isSelected: isSelected))
			}
			
		} else {
			
			NavigationLink(value: value) {
				ThemeLabel(
					text: title,
					icon: icon
				)
			}
			.themeListRow(isSelected: isSelected)
			
		}
	}
}


// MARK: - Preview

#Preview {
	
	enum NavItem: Codable, Hashable {
		case itemA, itemB
	}
	
	return ThemePreviewContainer(.screen) {
		
		Section {
			
			NavItemRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: true, isSelected: false)
			NavItemRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: true, isSelected: true)
			
			NavItemRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: false, isSelected: false)
			NavItemRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: false, isSelected: true)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "NavItemRow", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}
