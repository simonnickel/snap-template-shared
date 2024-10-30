//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapSettingsService

public extension Dependencies {

	var settingsService: SettingsService { SettingsService() }
	
	/// Defined in `SnapTemplateSettings`, but has to be setup from App.
	var templateSettingsNavigator: TemplateSettingsNavigator { Dependencies.forwarding(for: \.templateSettingsNavigator) }

}
