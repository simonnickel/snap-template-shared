//
//  InterfaceScale.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 04.05.24.
//

import SnapTheme

public enum InterfaceScale: String, PickableSetting {
	
	// TODO Localisation
	public static var title: String { "Interface Scale" }
	
	public var id: String { self.rawValue }
	
	// TODO Localisation
	public var title: String { self.rawValue.uppercasedFirstLetter }
	
	
	// MARK: - Options
	
	case tiny, small, medium, large, huge
	
	public var scale: Theme.NumberKey {
		switch self {
			case .tiny: .interfaceScaleTiny
			case .small: .interfaceScaleSmall
			case .medium: .interfaceScaleMedium
			case .large: .interfaceScaleLarge
			case .huge: .interfaceScaleHuge
		}
	}
	
}
