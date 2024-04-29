//
//  Settings+DisplayMode.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 11.10.23.
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let displayMode = SettingsService.Setting<DisplayMode>("Settings.Appearance.DisplayMode", in: .defaults, default: .system)
	
}
