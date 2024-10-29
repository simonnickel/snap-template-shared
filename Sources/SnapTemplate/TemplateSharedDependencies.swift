//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapSettingsService

public enum TemplateDependencies {
	
	public static func registerDependencies() {
		
		Dependencies.register(type: SettingsService.self) { SettingsService() }
		Dependencies.register(type: TemplateState.self, factory: { TemplateState() })
		
	}
	
}