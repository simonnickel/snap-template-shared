//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

public struct TemplateState {
	
	public init(showSettings: Bool = false, displayMode: DisplayMode? = nil, interfaceScale: InterfaceScale? = nil, navigationLayout: NavigationLayout? = nil, accentColor: Theme.ColorSet? = nil) {
		self.showSettings = showSettings
		self.displayMode = displayMode
		self.interfaceScale = interfaceScale
		self.navigationLayout = navigationLayout
		self.accentColor = accentColor
	}
	
	/// Controls display of the settings sheet.
	public var showSettings: Bool
	
	/// Overrides the system color scheme (dark / light) for the `AppContainer`, propagates up the view hierarchy using .preferredColorScheme.
	public var displayMode: DisplayMode?
	
	public var interfaceScale: InterfaceScale?
	
	public var navigationLayout: NavigationLayout?
	
	/// Accent selected in Settings.
	public var accentColor: Theme.ColorSet?
	
}
