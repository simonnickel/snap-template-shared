//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTheme
import SwiftUI

extension SnapNavigation {
    
    // TODO: This needs to be exposed to user of SnapTemplate
    
    /// Combining `SnapNavigation` with `SnapTheme` to provide a themed `NavigationLink` (it's a Button) to use in a `List`.
    public struct ListRow<Destination: SnapNavigationDestination>: View {
        
        @Environment(\.navigator) private var navigator
        @Environment(\.isPresentingDestination) private var isPresentingDestination
        
        private let destination: Destination

        package init(destination: Destination) {
            self.destination = destination
        }
        
        public var body: some View {
            Button {
                navigator(.present(destination, style: .push))
            } label: {
                AnyView(destination.definition.label
                    .labelStyle(.themeListRow()))
            }
            .themeListRow(isSelected: isPresentingDestination(destination))
        }
        
    }
    
}
