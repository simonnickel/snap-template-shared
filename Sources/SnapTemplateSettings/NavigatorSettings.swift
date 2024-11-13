//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateShared
import SwiftUI

typealias NavigatorSettings = SnapNavigation.NavigatorTranslator

extension NavigatorSettings {
    
    struct ListRow<Destination: SnapNavigationDestination>: View {
        
        @Environment(NavigatorSettings.self) private var navigator
        
        let destination: Destination
        
        var body: some View {
            SnapNavigation.DestinationListRow(destination: destination) {
                navigator.present(destination: destination, style: .push)
            }
        }
        
    }
    
}
