//
//  NavigationDestinationFactory.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 29.05.24.
//

import SwiftUI
import SnapMatchingNavigation

public protocol NavigationDestinationFactory {
	
	associatedtype DestinationType: Hashable

	@MainActor
	func destination(for destination: DestinationType, in mode: MNavContainer.Mode) -> any View
		
}
