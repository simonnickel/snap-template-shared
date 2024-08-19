//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapSettingsService
import SnapTheme

public extension SettingsService.SettingDefinition {
	
	static let accentColor = SettingsService.Setting<Theme.ColorSet?>("Settings.Appearance.accentColor", in: .ubiquitous, default: nil)
	
}
