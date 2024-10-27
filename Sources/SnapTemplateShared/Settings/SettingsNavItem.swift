//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapTheme
import SnapSettingsService

public enum TemplateSettingsScreens: SnapNavigationScreen {
	
	case screen
	case tabs

	public var definition: SnapNavigation.ScreenDefinition<Self> {
		switch self {
			case .screen: .init(title: "Rectangle", icon: Theme.IconKey.settings) { _ in TemplateSettingsScreen() }
			case .tabs: .init(title: "Configure Tabs", icon: Theme.IconKey.settingsTabs) { _ in
				@Dependency var settings: SettingsService
				ConfigureTabsScreen(defaultConfiguration: settings.value(.navigationTabs).value)
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
		definition.destination?(self) ?? EmptyView()
	}
	
}
