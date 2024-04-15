//
//  Settings+NavigationTabs.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 11.10.23.
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let navigationTabs = SettingsService.Setting<TabConfiguration?>("Settings.Appearance.navigationTabs", in: .defaults, default: nil)
	
}
