//
//  TemplateDestination.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 29.05.24.
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
