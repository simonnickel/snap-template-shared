//
//  Settings+NavigationLayout.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 12.10.23.
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let navigationLayout = SettingsService.Setting<NavigationLayout>("Settings.Appearance.NavigationLayout", in: .defaults, default: .automatic)
	
}

