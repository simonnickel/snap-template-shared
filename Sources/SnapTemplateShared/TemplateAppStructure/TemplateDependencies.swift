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

@MainActor
@Observable public class TemplateDependencies {
	
	public var templateState: TemplateState
	
	@ObservationIgnored let settings: SettingsService = SettingsService()
	
	public init(templateState: TemplateState = TemplateState()) {
		
		self.templateState = templateState
		setupDisplayMode()
		setupInterfaceScale()
		setupNavigationLayout()
		setupAccentColor()
		
	}
	
	
	// MARK: - Apply
	
	/// Apply dependencies defined in template.
	public func apply<Content: View>(on content: Content) -> some View {
		
		var theme = templateState.theme
		
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
		
		templateState.theme = theme
		
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
			}
			.store(in: &subscriptions)
	}
	
}
