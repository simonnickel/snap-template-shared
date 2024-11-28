//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapTheme

extension Theme.NumberKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.NumberKey : Theme.NumberValue] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.NumberKey] = [.exampleNumber]
	
	public static let exampleNumber = Theme.NumberKey("exampleNumber", default: .value(10))
	
}
