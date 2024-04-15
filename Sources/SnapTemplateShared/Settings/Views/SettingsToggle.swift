//
//  SettingsToggle.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 05.12.23.
//

import SwiftUI
import SnapCore
import SnapTheme
import SnapSettingsService

public struct SettingsToggle: View {
		
	@Environment(\.serviceSettings) private var settings
	
	private let title: String
	
	private let setting: SettingsService.Value<Bool>
	
	public init(title: String, setting: SettingsService.Value<Bool>) {
		self.title = title
		self.setting = setting
	}
	
	public var body: some View {
		
		ToggleTapable(isOn: setting.binding) {
			Text(title)
		}
		
	}
	
}


