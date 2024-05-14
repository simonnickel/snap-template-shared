//
//  TemplateState+Environment.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 12.10.23.
//

import SwiftUI

private struct TemplateStateBindingKey: EnvironmentKey {
	static let defaultValue: Binding<TemplateState> = .constant(TemplateState())
}

private struct TemplateStateKey: EnvironmentKey {
	static var defaultValue: TemplateState {
		// TODO concurrency: Instead of a `static let` this needs to be a computed property. Just applying @MainActor does not fullfill requirements for `EnvironmentKey` implementation.
		// Not sure if this might be something that is solved in a future version of Swift or SwiftUI.EnvironmentKey.
		// Static property 'defaultValue' is not concurrency-safe because it is not either conforming to 'Sendable' or isolated to a global actor; this is an error in Swift 6
		// Main actor-isolated static property 'defaultValue' cannot be used to satisfy nonisolated protocol requirement
		TemplateState()
	}
}

public extension EnvironmentValues {
	
	/// It's a Binding to allow values to be changed from inside the view hierarchy.
	var templateStateBinding: Binding<TemplateState> {
		get { self[TemplateStateBindingKey.self] }
		set { self[TemplateStateBindingKey.self] = newValue }
	}
	
	var templateState: TemplateState {
		get { self[TemplateStateKey.self] }
		set { self[TemplateStateKey.self] = newValue }
	}
	
}
