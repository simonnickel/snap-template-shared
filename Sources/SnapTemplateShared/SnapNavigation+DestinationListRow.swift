//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTheme
import SwiftUI

extension SnapNavigation {
    
    /// Combining `SnapNavigation` with `SnapTheme` to provide a themed `NavigationLink` (it's a Button) to use in a `List`.
    package struct DestinationListRow<Destination: SnapNavigationDestination>: View {
        
        @Environment(\.isPresentingDestination) private var isPresentingDestination
        
        private let destination: Destination
        private let navigate: () -> Void

        package init(destination: Destination, navigate: @escaping () -> Void) {
            self.destination = destination
            self.navigate = navigate
        }
        
        package var body: some View {
            Button {
                navigate()
            } label: {
                AnyView(destination.definition.label
                    .labelStyle(.themeListRow()))
            }
            .themeListRow(isSelected: isPresentingDestination(destination))
        }
        
    }
    
}
