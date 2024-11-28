//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapTemplateShared
import SnapNavigation
import SwiftUI

/// Combining `SnapNavigation` with `SnapTheme` to provide a themed `NavigationLink` (it's a Button) to use in a `List`.
/// Forwards to internal
public struct NavigationListRow<Destination: SnapNavigationDestination>: View {
    
    private let destination: Destination
    
    public init(destination: Destination) {
        self.destination = destination
    }
    
    public var body: some View {
        TemplateListRow(destination: destination)
    }
    
}
