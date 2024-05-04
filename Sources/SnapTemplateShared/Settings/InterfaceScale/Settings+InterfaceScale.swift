//
//  Settings+InterfaceScale.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 04.05.24.
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let interfaceScale = SettingsService.Setting<InterfaceScale>("Settings.Appearance.InterfaceScale", in: .defaults, default: .medium)
	
}
