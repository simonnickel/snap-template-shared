//
//  ConfigureTabsScreen.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 29.09.23.
//

import SwiftUI
import SnapTheme
import SnapSettingsService

public struct ConfigureTabsScreen: View {
	
	@Environment(\.serviceSettings) private var settings

	private let defaultConfiguration: TabConfiguration

	public init(defaultConfiguration: TabConfiguration) {
		self.defaultConfiguration = defaultConfiguration
	}
	
	@State private var tabsSetting: SettingsService.Value<TabConfiguration?>?
	
	public var body: some View {
		
		Group {
			if let tabsSetting {
				TabList(tabsSetting: tabsSetting, defaultConfiguration: defaultConfiguration)
			} else {
				ThemeEmptyDecorationView(text: "Tab Configuration not loaded")
			}
		}
		.onAppear() {
			tabsSetting = settings.value(.navigationTabs)
		}
		
	}
	
}


// MARK: - Previews

#Preview {
	
	let tab1 = TabConfiguration.Tab(id: "Tab1", name: "Tab1", icon: nil)
	
	let configuration = TabConfiguration(
		tabs: [tab1],
		required: [],
		disabled: [],
		initial: tab1
	)
	return ConfigureTabsScreen(
		defaultConfiguration: configuration
	)
	.environment(\.serviceSettings, SettingsService())
	
}
