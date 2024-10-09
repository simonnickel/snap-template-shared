//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapMatchingNavigation

public protocol TemplateDestination: MNavItem, Hashable {
	
	var title: String? { get }
	
	var icon: Theme.IconKey? { get }
	
}

public extension TemplateDestination {
	
	
	// MARK: MNavItem
	
	@MainActor
	var tabItem: any View {
		ThemeTabItem(text: title, icon: icon)
	}
	
	var idDefault: String {
		String(reflecting: self).split(by: ["."]).last ?? ""
	}
	
}
