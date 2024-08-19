//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapSettingsService
import SnapMatchingNavigation
	
public struct TemplateContent: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	@Environment(\.serviceSettings) private var settings
	
	// TODO FB13214002: SwiftUI: Setting PreferredColorScheme to nil does not work in sheet.
	@Environment(\.colorScheme) private var colorScheme
	
	@ViewBuilder private let splitScene: () -> any View
	@ViewBuilder private let tabScene: (_ settings: SettingsService) -> any View
	@ViewBuilder private let settingsScene: () -> any View

	public init(splitScene: @escaping () -> any View, tabScene: @escaping (SettingsService) -> any View, settingsScene: @escaping () -> any View) {
		self.splitScene = splitScene
		self.tabScene = tabScene
		self.settingsScene = settingsScene
	}
	
	public var body: some View {
		
		Group {
			switch templateStateBinding.navigationLayout.wrappedValue ?? .automatic {
					
				case .automatic: MNavContainer(splitScene: splitScene, tabScene: { tabScene(settings) })
					
				case .sidebar: AnyView(splitScene()) // TODO: Sidebar on iPhone needs title
					
				case .tab: AnyView(tabScene(settings))
					
			}
		}
		.modalPresentation(style: .sheet, isPresented: templateStateBinding.showSettings, content: {
			
			ThemeCloseContainer() {
				AnyView(settingsScene())
			}
			.themeModal(detents: [.large])
			// TODO FB13214002: SwiftUI: Setting PreferredColorScheme to nil does not work in sheet.
			// Workaround: Explicitly set environment colorScheme from outside of sheet.
			.preferredColorScheme(colorScheme)
			
		})
		
	}
	
}
