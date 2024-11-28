//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapTheme

extension Theme.ColorKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.ColorKey : Theme.ColorValue] {[
		:
				// .accentColorBase: .color(.purple)
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.ColorKey] = [.exampleColor]
	
	public static let exampleColor = Theme.ColorKey("exampleColor", default: .color(.purple))
	
}
