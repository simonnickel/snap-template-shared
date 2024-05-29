//
//  SettingsToolbarButton.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 29.05.24.
//

import SwiftUI
import SnapTheme

public struct ToolbarButtonSettings: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	public init() { }
	
	public var body: some View {
		
		Button {
			templateStateBinding.showSettings.wrappedValue.toggle()
		} label: {
			ThemeLabel(
				text: "Settings",
				icon: .settings
			)
		}

	}
	
}
