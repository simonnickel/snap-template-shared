//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapSettingsService

public protocol PickableSetting: Identifiable, Codable, Hashable, Sendable, CaseIterable where AllCases == Array<Self> {
	
	static var title: String { get }
	var title: String { get }
	
}

public struct SettingsPicker<Setting: PickableSetting>: View {
		
	@Environment(\.serviceSettings) private var settings
	
	private let setting: SettingsService.Value<Setting>
	
	public init(setting: SettingsService.Value<Setting>) {
		self.setting = setting
	}
	
	public var body: some View {
		
		// TODO: ThemePickerSegmented
		Picker(selection: setting.binding) {
			ForEach(Setting.allCases) { option in
				Text(option.title)
					.tag(option)
			}
		} label: {
			// Label is only displayed on macOS.
			Text(Setting.title)
				.frame(maxWidth: .infinity, alignment: .leading)
		}
		.pickerStyle(.segmented)
		
	}
	
}
