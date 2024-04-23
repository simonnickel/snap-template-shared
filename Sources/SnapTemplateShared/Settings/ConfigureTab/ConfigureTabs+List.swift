//
//  ConfigureTabs+List.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 11.10.23.
//

import SwiftUI
import SnapTheme
import SnapSettingsService

extension ConfigureTabsScreen {
	
	struct TabList: View {
		
		let tabsSetting: SettingsService.Value<TabConfiguration?>
		let defaultConfiguration: TabConfiguration
		
		@MainActor
		private var tabs: [TabConfiguration.Tab] {
			let configuration = tabsSetting.value?.updated(withDefaults: defaultConfiguration) ?? defaultConfiguration
			return configuration.tabs
		}
		
		var body: some View {
			ThemeSceneSettings {
				
				Section {
					ForEach(tabs) { tab in
						ListRow(
							tab: tab,
							tabsSetting: tabsSetting,
							defaultConfiguration: defaultConfiguration
						)
					}
					.onMove { from, to in
						var tabs = tabs
						tabs.move(fromOffsets: from, toOffset: to)
						
						let configuration = tabsSetting.value ?? defaultConfiguration
						tabsSetting.set(configuration.updated(tabs: tabs))
					}
				} footer: {
					// TODO Localization
					ThemeLabel(text: "First 5 tabs are displayed.")
				}
				
				Section {
					let configuration = tabsSetting.value?.updated(withDefaults: defaultConfiguration) ?? defaultConfiguration
					let options = configuration.tabs
						.filter({ tab in
							configuration.isVisible(tab)
						})
					if let initial = configuration.initial ?? defaultConfiguration.initial ?? options.first {
						InitialTabPicker(
							options: options,
							selected: initial,
							tabsSetting: tabsSetting,
							defaultConfiguration: defaultConfiguration
						)
					}
				}
				
				if tabsSetting.value != nil && tabsSetting.value != defaultConfiguration {
					// TODO Localization
					ThemeListButton(text: "Reset") {
						tabsSetting.set(nil)
					}
				}
				
			}
#if !os(macOS) // TODO macOS
			.environment(\.editMode, .constant(.active))
#endif
		}
	}
	
}
