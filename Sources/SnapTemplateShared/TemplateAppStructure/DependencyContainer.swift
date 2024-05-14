//
//  DependencyContainer.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

public protocol Dependencies {
	
	@MainActor
	func apply<Content: View>(on content: Content) -> any View
	
}

/// The `DependencyContainer` applies dependencies on the `Content`.
public struct DependencyContainer<Content: View>: View {
	
	private let dependenciesApp: Dependencies
	private let dependenciesTemplate: Dependencies

	@ViewBuilder private let content: () -> Content
	
	/// The `DependencyContainer` applies dependencies on the `Content`.
	/// - Parameters:
	///   - dependenciesApp: `AppDependencies` should be owned outside of the View.
	///   - dependenciesTemplate: `TemplateDependencies` should be owned outside of the View.
	///   - content: Closure that builds the content to apply the dependencies on.
	public init(dependencies: Dependencies, dependenciesTemplate: Dependencies, @ViewBuilder content: @escaping () -> Content) {
		self.dependenciesApp = dependencies
		self.dependenciesTemplate = dependenciesTemplate
		self.content = content
	}
	
	public var body: some View {
		
		AnyView(
			dependenciesTemplate.apply(on: dependenciesApp.apply(on: content()))
		)
		
	}
	
}
