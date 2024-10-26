//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct TemplateState {
	
	public init(displayMode: DisplayMode? = nil, interfaceScale: InterfaceScale? = nil, navigationLayout: NavigationLayout? = nil, accentColor: Theme.ColorSet? = nil) {
		self.displayMode = displayMode
		self.interfaceScale = interfaceScale
		self.navigationLayout = navigationLayout
		self.accentColor = accentColor
	}

	/// Overrides the system color scheme (dark / light) for the `AppContainer`, propagates up the view hierarchy using .preferredColorScheme.
	public var displayMode: DisplayMode?
	
	public var interfaceScale: InterfaceScale?
	
	// TODO: Adapt navigation layout options in SnapNavigation.
	public var navigationLayout: NavigationLayout?
	
	/// Accent selected in Settings.
	public var accentColor: Theme.ColorSet?
	
}
