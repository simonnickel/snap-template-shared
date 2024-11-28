//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapTheme

extension Theme.IconKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.IconKey : Theme.IconValue] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.IconKey] = [.navGroupRectangle, .navGroupCircle, .navGroupTriangle]
	
	public static let navGroupRectangle = Theme.IconKey("navGroupRectangle", default: .system(name: "rectangle"))
	public static let navGroupCircle = Theme.IconKey("navGroupCircle", default: .system(name: "circle"))
	public static let navGroupTriangle = Theme.IconKey("navGroupTriangle", default: .system(name: "triangle"))
	
}
