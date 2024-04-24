//
//  AccentColorPicker.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 15.10.23.
//

import SwiftUI
import SnapTheme
import SnapSettingsService

// TODO: Wrap lines on dynamic type sizes

public struct AccentColorPicker: View {
	
	private enum Constants {
		static let widthMax: CGFloat = 550
	}
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	@Environment(\.serviceSettings) private var settings
	
	private let setting: SettingsService.Value<Theme.ColorSet?>
	private let defaultSetKey: Theme.ColorKey
	
	public init(setting: SettingsService.Value<Theme.ColorSet?>, defaultSet: Theme.ColorKey) {
		self.setting = setting
		self.defaultSetKey = defaultSet
	}
	
	public var body: some View {
		let colorSetSets: [[Theme.ColorSet]] = [
			[
				.init(base: .systemRed),
				.init(base: .systemOrange),
				.init(base: .systemYellow),
				.init(base: .systemGreen),
				.init(base: .systemMint),
				.init(base: .systemTeal),
				.init(base: .systemCyan),
				.init(base: .systemBlue),
				.init(base: .systemIndigo),
				.init(base: .systemPurple),
				.init(base: .systemPink),
//				.init(base: .systemBrown)
			], [
				.init(base: .systemRedAdjusted),
				.init(base: .systemOrangeAdjusted),
				.init(base: .systemYellowAdjusted),
				.init(base: .systemGreenAdjusted),
				.init(base: .systemMintAdjusted),
				.init(base: .systemTealAdjusted),
				.init(base: .systemCyanAdjusted),
				.init(base: .systemBlueAdjusted),
				.init(base: .systemIndigoAdjusted),
				.init(base: .systemPurpleAdjusted),
				.init(base: .systemPinkAdjusted),
//				.init(base: .systemBrownAdjusted)
			], [
				Theme.ColorKey.systemColorSet(for: .red),
				Theme.ColorKey.systemColorSet(for: .orange),
				Theme.ColorKey.systemColorSet(for: .yellow),
				Theme.ColorKey.systemColorSet(for: .green),
				Theme.ColorKey.systemColorSet(for: .mint),
				Theme.ColorKey.systemColorSet(for: .teal),
				Theme.ColorKey.systemColorSet(for: .cyan),
				Theme.ColorKey.systemColorSet(for: .blue),
				Theme.ColorKey.systemColorSet(for: .indigo),
				Theme.ColorKey.systemColorSet(for: .purple),
				Theme.ColorKey.systemColorSet(for: .pink),
//				Theme.ColorKey.systemColorSet(for: .brown),
			].compactMap({$0})
		]
		
		ForEach(colorSetSets, id: \.self) { colorSets in
			
			ThemeHStack(spacing: .spacingElements) {
				ForEach(colorSets) { colorSet in
					
					let isSelected = colorSet == (setting.value ?? theme.colorSet(for: defaultSetKey))
					
					let themeReplaced = theme.replacingValues(
						colors: [
							.accentColors : .colorSet(colorSet.base, complimentary: colorSet.complimentary, complementary: colorSet.complementary)
						]
					)
					
					ZStack {
						Circle()
							.theme(surface: .accentGradientBackground)
							.environment(\.theme, themeReplaced)
						if isSelected {
							Circle()
								.fill(.clear)
								.stroke(Color.primary, lineWidth: theme.number(.strokeSelected, scaled: scaleFactor) ?? 2) // TODO: Theme View Modifier, choose correct color key
						}
					}
					.onTapGesture {
						setting.set(colorSet)
					}
					
				}
			}
			.frame(maxWidth: Constants.widthMax, alignment: .center)
			
		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
	let settings = SettingsService()
	
	return ThemePreviewContainer(.view) {
		
		AccentColorPicker(setting: settings.value(.accentColor), defaultSet: .accentColors)
		
	}
	
}

