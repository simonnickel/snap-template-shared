//
//  DependencyWrapper.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

/// A container to setup and hold dependencies, to be applied using the `DependencyWrapper`.
public protocol DependencyContainer {
	
	@MainActor
	func apply<Content: View>(on content: Content) -> any View
	
}

/// The `DependencyWrapper` applies the templates and apps`DependencyContainer` on the `Content` view.
public struct DependencyWrapper<Content: View>: View {
	
	private let dependenciesApp: DependencyContainer
	private let dependenciesTemplate: DependencyContainer

	@ViewBuilder private let content: () -> Content
	
	/// The `DependencyWrapper` applies dependencies on the `Content`.
	/// - Parameters:
	///   - dependenciesApp: `AppDependencies` should be owned outside of the View.
	///   - dependenciesTemplate: `TemplateDependencies` should be owned outside of the View.
	///   - content: Closure that builds the content to apply the dependencies on.
	public init(dependencies: DependencyContainer, dependenciesTemplate: DependencyContainer, @ViewBuilder content: @escaping () -> Content) {
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
