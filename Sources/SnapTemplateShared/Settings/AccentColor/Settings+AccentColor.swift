//
//  Settings+AccentColor.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 15.10.23.
//

import SnapSettingsService
import SnapTheme

public extension SettingsService.SettingDefinition {
	
	static let accentColor = SettingsService.Setting<Theme.ColorSet?>("Settings.Appearance.accentColor", in: .ubiquitous, default: nil)
	
}
