//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateSettings
import SnapTheme
import SwiftUI

enum AppDestination: SnapNavigationDestination {
		
	case rectangle
	case rectangleA, rectangleB
	
	case circle
	case circleA
	
	case triangle
	
	case settingsTemplate(_ destination: TemplateSettingsDestination)

	var definition: SnapNavigation.ScreenDefinition {
		switch self {
			case .rectangle: .init(title: "Rectangle", icon: Theme.IconKey.navGroupRectangle)
			case .rectangleA: .init(title: "Rectangle A", icon: Theme.IconKey.navGroupRectangle.id)
			case .rectangleB: .init(title: "Rectangle B", icon: Theme.IconKey.navGroupRectangle.id)
				
			case .circle: .init(title: "Circle", icon: Theme.IconKey.navGroupCircle)
			case .circleA: .init(title: "Circle A", icon: Theme.IconKey.navGroupCircle)
				
			case .triangle: .init(title: "Triangle", icon: Theme.IconKey.navGroupTriangle)
			
			case .settingsTemplate(let destination): destination.definition
		}
	}
	
	
	// MARK: Definition Overrides

	@MainActor
	var label: any View {
		let icon = definition.icon as? Theme.IconKey
		return ThemeLabel(text: definition.title, icon: icon)
	}
	
	@MainActor
	var destination: any View {
		definition.destination?() ?? ExampleScreen(destination: self)
	}
	
}
