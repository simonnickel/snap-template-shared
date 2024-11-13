//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapTemplateShared

extension SnapNavigation.Navigator {
    
    public struct ListRow: View {
        
        @Environment(SnapNavigation.Navigator<NavigationProvider>.self) private var navigator
        
        private let destination: Destination
        
        public init(destination: SnapNavigation.Navigator<NavigationProvider>.Destination) {
            self.destination = destination
        }
        
        public var body: some View {
            SnapNavigation.DestinationListRow(destination: destination) {
                navigator.present(destination: destination, style: .push)
            }
        }
        
    }
    
}
