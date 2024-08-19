//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapMatchingNavigation

public protocol NavigationDestinationFactory {
	
	associatedtype DestinationType: Hashable

	@MainActor
	func destination(for destination: DestinationType, in mode: MNavContainer.Mode) -> any View
		
}
