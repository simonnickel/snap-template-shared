//
//  NavigationLayout.swift
//	SnapTemplateShared
//
//  Created by Simon Nickel on 12.10.23.
//

import Foundation

public enum NavigationLayout: String, PickableSetting {
	
	// TODO Localisation
	public static var title: String { "Navigation Layout" }
		
	public var id: String { self.rawValue }
	
	// TODO Localisation
	public var title: String { self.rawValue.uppercasedFirstLetter }
	
	
	// MARK: - Options
	
	/// Automatically determine Layout.
	case automatic
	
	/// Layout with a `TabBar` controlling the main content.
	case tab
	
	/// Layout as SplitView with a `Sidebar` controlling the main content.
	case sidebar
	
}
