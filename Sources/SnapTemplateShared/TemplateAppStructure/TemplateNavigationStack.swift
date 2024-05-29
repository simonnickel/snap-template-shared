//
//  TemplateNavigationStack.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 29.05.24.
//

import SwiftUI
import SnapMatchingNavigation

public struct TemplateNavigationStack<Factory: NavigationDestinationFactory, DestinationType>: View where Factory.DestinationType == DestinationType {
	
	let factory: Factory
	let root: DestinationType
	let mode: MNavContainer.Mode
	
	public init(factory: Factory, root: DestinationType, mode: MNavContainer.Mode) {
		self.factory = factory
		self.root = root
		self.mode = mode
	}
	
	public var body: some View {
		NavigationStack {
			
			AnyView(factory.destination(for: root, in: mode))
				.navigationDestination(for: DestinationType.self) { scene in
					AnyView(factory.destination(for: scene, in: mode))
				}
			
		}
	}
	
}
