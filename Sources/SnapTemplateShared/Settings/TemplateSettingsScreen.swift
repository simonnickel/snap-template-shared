//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapDependencies
import SnapSettingsService

// TODO Localization

public struct TemplateSettingsScreen: View {
	
	public init() {}
	
	@Dependency private var templateState: TemplateState
	@Dependency private var settings: SettingsService
	
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
				
				// TODO: 
				// TODO: .themeListRow() can not maintain selection state without navSelectionState. Should be handled by Navigator.
				ThemeListRowNavigationLink(value: TemplateSettingsDestination.tabs, state: navSelectionState) {
					ThemeLabel(text: "Configure Tab Bar", style: .themeListRow())
				}
				
			} header: {
				ThemeLabel(text: "Navigation", style: .themeSectionHeader())
			}
			
		}
		// TODO: Should come from TemplateContent, like Theme. Not sure why it does not work.
		.preferredColorScheme(templateState.displayMode?.colorScheme)
		
	}
	
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		TemplateSettingsScreen()
		
	}
	
}
