//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateApp
import SwiftUI

// TODO: Settings on iPhone

@main
struct SnapTemplateDemoApp: App {
	
    var body: some Scene {

		SnapNavigationApp(provider: AppNavigationProvider()) { window, content in
			content
				.modifier(TemplateModifierScene(window: window))
		}

    }
	
}


// MARK: - Preview

#Preview {
	
	// TODO: Theme in Dependencies with .override
//	let template = TemplateDependencies(templateState: .init(),
//		theme: .baseApp.replacingValues(
//			colors: [
//				.accentColorBase: .color(.purple)
//			]
//		)
//	)
	
    SnapNavigationPreview(provider: AppNavigationProvider()) { window, content in
        content
            .modifier(TemplateModifierScene<AppDestination>(window: window))
    }
	
}
