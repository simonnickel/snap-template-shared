//
//  TemplateState.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 12.10.23.
//

import SwiftUI
import SnapTheme

public struct TemplateState {
	
	public init(theme: Theme = .base, showSettings: Bool = false, displayMode: DisplayMode? = nil, interfaceScale: InterfaceScale? = nil, navigationLayout: NavigationLayout? = nil, accentColor: Theme.ColorSet? = nil) {
		self.theme = theme
		self.showSettings = showSettings
		self.displayMode = displayMode
		self.interfaceScale = interfaceScale
		self.navigationLayout = navigationLayout
		self.accentColor = accentColor
	}
	
	/// The `Theme` applied to the AppContainer.
	public var theme: Theme
	
	/// Controls display of the settings sheet.
	public var showSettings: Bool
	
	/// Overrides the system color scheme (dark / light) for the `AppContainer`, propagates up the view hierarchy using .preferredColorScheme.
	public var displayMode: DisplayMode?
	
	public var interfaceScale: InterfaceScale?
	
	public var navigationLayout: NavigationLayout?
	
	public var navigationSplitSidebarVisibility: NavigationSplitViewVisibility = .all
	
	/// Accent selected in Settings.
	public var accentColor: Theme.ColorSet?
	
}
