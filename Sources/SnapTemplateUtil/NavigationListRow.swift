//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTheme
import SwiftUI

/// Combining `SnapNavigation` with `SnapTheme` to provide a themed `NavigationLink` (it's a Button) to use in a `List`.
public struct NavigationListRow<Destination: SnapNavigationDestination>: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.navigationState) private var navigationState
    @Environment(\.isPresentingDestination) private var isPresentingDestination
    
    private let destination: Destination
    
    @State private var isActive: Bool = false
    
    public init(destination: Destination) {
        self.destination = destination
    }
    
    public var body: some View {
        Button {
            navigator(.present(destination, style: .push))
        } label: {
            ThemeLabel(text: destination.definition.title, icon: destination.icon)
                .labelStyle(.themeListRow())
        }
        .onChange(of: navigationState) { _, _ in
            isActive = isPresentingDestination(destination)
        }
        .themeListRow(isSelected: isActive)
    }
    
}
