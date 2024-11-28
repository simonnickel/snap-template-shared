//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateUtil
import SnapTheme
import SwiftUI

// TODO: See ToolbarButtonSettings below
import SnapTemplateSettings

struct ExampleScreen: View {
	
	@Environment(\.theme) private var theme
	@Dependency(\.dataSource) private var dataSource
    @Environment(\.navigator) private var navigator
	
	let destination: AppDestination
	
	var body: some View {
		
        ThemeScreen(style: .plain) {
            
            List {

                Section {
                    
                    Text(dataSource.content)
                        .themeListRow()
                    
                    NavigationListRow(destination: AppDestination.rectangle)
                    
                } header: {
                    
                    Text(destination.definition.title + " Screen")
                        .theme(font: .listHeader)
                    
                } footer: {
                    
                    ThemeVStack(spacing: .spacingElements) {
                        Button(action: {
                            navigator(.present(AppDestination.circle))
                        }, label: {
                            ThemeLabel(text: "Push .circle", style: .themeButtonPrimary)
                        })
                        .buttonStyle(.themePrimary)
                        
                        // TODO: Should be part of the template and in the navigationbar.
                        ToolbarButtonSettings()
                    }
                    .theme(padding: .spacingGroups, [.vertical, .trailing])
                    .frame(maxWidth: .infinity)
                    
                }
	
			}
	
		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
    ExampleScreen(destination: .circle)
	
}
