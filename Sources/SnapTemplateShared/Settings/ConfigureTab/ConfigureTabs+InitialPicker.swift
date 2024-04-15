//
//  ConfigureTabs+InitialPicker.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 11.10.23.
//

import SwiftUI
import SnapSettingsService
import SnapTheme

extension ConfigureTabsScreen {
	
	struct InitialTabPicker: View {
		
		let options: [TabConfiguration.Tab]
		@State var selected: TabConfiguration.Tab
		let tabsSetting: SettingsService.Value<TabConfiguration?>
		let defaultConfiguration: TabConfiguration
		
		public var body: some View {
			Picker(selection: $selected) {
				ForEach(options) { tab in
					ThemeLabel(text: tab.name, icon: tab.icon)
						.tag(tab)
				}
			} label: {
				// TODO Localization
				ThemeLabel(text: "Initial Tab")
			}
			.onChange(of: selected) { oldValue, newValue in
				let configuration = tabsSetting.value ?? defaultConfiguration
				tabsSetting.set(configuration.updated(initial: newValue))
			}
			.onChange(of: tabsSetting.value) { oldValue, newValue in
				if let initial = (tabsSetting.value ?? defaultConfiguration).initial {
					selected = initial
				}
			}

		}
		
	}
	
}
