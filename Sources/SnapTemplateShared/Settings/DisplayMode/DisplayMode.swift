//
//  DisplayMode.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 11.10.23.
//

import SwiftUI

public enum DisplayMode: String, PickableSetting {
	
	// TODO Localisation
	public static var title: String { "Display Mode" }
	
	public var id: String { self.rawValue }
	
	// TODO Localisation
	public var title: String { self.rawValue.uppercasedFirstLetter }
	
	
	// MARK: - Options
	
	case light, system, dark
	
	public var colorScheme: ColorScheme? {
		switch self {
			case .light: .light
			case .dark: .dark
			default: nil
		}
	}
	
}
