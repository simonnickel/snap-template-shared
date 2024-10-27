//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapTheme
import SnapSettingsService

// TODO: Is Codable really needed?
public enum TemplateSettingsDestination: SnapNavigationDestination, Codable {
	
	case screen
	case tabs

	public var definition: SnapNavigation.ScreenDefinition {
		switch self {
			case .screen: .init(title: "Rectangle", icon: Theme.IconKey.settings, style: .modal) { TemplateSettingsScreen() }
			case .tabs: .init(title: "Configure Tabs", icon: Theme.IconKey.settingsTabs) {
				
				// TODO: Inject default config, e.g. by defining a SnapNavigationScreen as generic.
//				static var tabConfigDefault: TabConfiguration { TabConfiguration(tabs: AppDestination.tabsAvailable.configArray, required: AppDestination.tabsRequired.configSet, disabled: AppDestination.tabsDisabledByDefault.configSet, initial: AppDestination.initial.configTab) }
				ConfigureTabsScreen(defaultConfiguration: .init(tabs: [], required: [], disabled: [], initial: nil))
			}
		}
	}
	
	
	// MARK: Definition Overrides

	@MainActor
	public var label: any View {
		let icon = definition.icon as? Theme.IconKey
		return ThemeLabel(text: definition.title, icon: icon)
	}
	
	@MainActor
	public var destination: any View {
		definition.destination?() ?? EmptyView()
	}
	
}
