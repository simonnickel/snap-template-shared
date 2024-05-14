//
//  TemplateDependencies.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 12.10.23.
//

import SwiftUI
import Combine
import SnapTheme
import SnapSettingsService

@Observable public class TemplateDependencies: Dependencies {
	
	public var templateState: TemplateState
	
	/// The `Theme` applied to the AppContainer.
	/// Not in TemplateState although it will change. It should not be observed, is accessible via Environment instead.
	@ObservationIgnored public var theme: Theme
	
	@ObservationIgnored let settings: SettingsService = SettingsService()
	
	public init(templateState: TemplateState = TemplateState(), theme: Theme = .base) {
		
		self.templateState = templateState
		self.theme = theme
		setupDisplayMode()
		setupInterfaceScale()
		setupNavigationLayout()
		setupAccentColor()
	}
	
	
	// MARK: - Apply
	
	/// Apply dependencies defined in template.
	public func apply<Content: View>(on content: Content) -> any View {
		
		return content
			.theme(apply: theme)
			.environment(\.serviceSettings, settings)
			.environment(\.templateState, templateState)
			.environment(\.templateStateBinding, Binding(get: {
				self.templateState
			}, set: { newValue in
				self.templateState = newValue
			}))
			.preferredColorScheme(templateState.displayMode?.colorScheme)
	}

	
	// MARK: - Settings Updates
	
	@ObservationIgnored private var subscriptions: [AnyCancellable] = []
	
	
	// MARK: DisplayMode
	
	private func setupDisplayMode() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.displayMode)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.templateState.displayMode = value
			}
			.store(in: &subscriptions)
	}
	
	
	// MARK: InterfaceScale
	
	private func setupInterfaceScale() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.interfaceScale)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.templateState.interfaceScale = value
			}
			.store(in: &subscriptions)
	}
	
	
	// MARK: NavigationLayout
	
	private func setupNavigationLayout() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.navigationLayout)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.templateState.navigationLayout = value
			}
			.store(in: &subscriptions)
	}
	
	
	// MARK: AccentColor
	
	private func setupAccentColor() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.accentColor)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.templateState.accentColor = value
				weakSelf.applyAccentColor()
			}
			.store(in: &subscriptions)
	}
	
	private func applyAccentColor() {
		var theme = self.theme
		
		if let accentColorSelected = templateState.accentColor {
			theme = theme.replacingValues(
				colors: [
					.accentColors : .colorSet(accentColorSelected.base, complimentary: accentColorSelected.complimentary, complementary: accentColorSelected.complementary)
				]
			)
		} else if let color = theme.systemColor(for: .accentColorBase)?.value {
			theme = theme.replaceAccent(base: color)
		}
		if let interfaceScale = templateState.interfaceScale {
			theme = theme.replacingValues(
				scale: theme.number(interfaceScale.scale)
			)
		}

		self.theme = theme
	}
	
}
