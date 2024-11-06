//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapDependencies
import SnapNavigation
import SnapSettingsService

// TODO Localization

public struct TemplateSettingsScreen: View {
	
	public init() {}
	
	@Dependency(\.settingsService) private var settings
	
	@Environment(Navigator.self) private var navigator
	
	// TODO: Does not work anymore. See comment below
	private let navSelectionState = ListNavState<TemplateSettingsDestination>()
	
	public var body: some View {
			
		ThemeSceneSettings(title: "Settings") {
			
			SettingsHeaderSection(name: "I am Simon Nickel", text: "I hope you enjoy using this template as much as I do enjoy creating it!")
			
			Section {
				
				SettingsRow(title: "Accent Color") {
					AccentColorPicker(
						setting: settings.value(.accentColor),
						defaultSet: .accentColors
					)
					.frame(maxWidth: .infinity, alignment: .center)
				}
				
				SettingsRow(title: DisplayMode.title) {
					SettingsPicker(setting: settings.value(.displayMode))
				}
				
				SettingsRow(title: InterfaceScale.title) {
					SettingsPicker(setting: settings.value(.interfaceScale))
				}
				
			} header: {
				ThemeLabel(text: "Appearance", style: .themeSectionHeader())
			}
			
			Section {
				
				SettingsRow(title: NavigationLayout.title) {
					SettingsPicker(setting: settings.value(.navigationLayout))
				}
				
				// TODO: .themeListRow() can not maintain selection state without navSelectionState. Should be handled by Navigator.
				// TODO: Button does not have disclosure indicator
				Button {
					navigator.present(destination: TemplateSettingsDestination.tabs, style: .push)
				} label: {
					ThemeLabel(text: "Configure Tab Bar", style: .themeListRow())
				}
//				.themeListRow(isSelected: true)

				ThemeListRowNavigationLink(value: TemplateSettingsDestination.tabs, state: navSelectionState) {
					ThemeLabel(text: "Configure Tab Bar", style: .themeListRow())
				}
				
			} header: {
				ThemeLabel(text: "Navigation", style: .themeSectionHeader())
			}
			
		}
		
	}
	
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		TemplateSettingsScreen()
		
	}
	
}
