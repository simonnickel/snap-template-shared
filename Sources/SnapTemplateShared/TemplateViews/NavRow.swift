//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct NavRow<Value>: View where Value : Decodable, Value : Encodable, Value : Hashable {
	
	public init(value: Value, title: String?, icon: Theme.IconKey?, inSidebar: Bool, isSelected: Bool) {
		self.value = value
		self.title = title
		self.icon = icon
		self.inSidebar = inSidebar
		self.isSelected = isSelected
	}
	
	let value: Value
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
				// TODO: iOS 18 - sidebar styling changed
//					.labelStyle(.themeSidebar(isSelected: isSelected))
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
			
			NavRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: true, isSelected: false)
			NavRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: true, isSelected: true)
			
			NavRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: false, isSelected: false)
			NavRow(value: NavItem.itemA, title: "Item A", icon: .favorite, inSidebar: false, isSelected: true)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "NavRow", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}
