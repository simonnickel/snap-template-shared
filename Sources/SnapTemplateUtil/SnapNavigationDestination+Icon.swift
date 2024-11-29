//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTheme

extension SnapNavigationDestination {
    
    var icon: Theme.IconKey? {
        definition.icon as? Theme.IconKey
    }
    
}
