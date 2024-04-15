//
//  TemplateDepencencies+ViewModifier.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 21.10.23.
//

import SwiftUI

public extension View {
	
	func apply(_ dependencies: TemplateDependencies) -> some View {
		return self.modifier(TemplateDependencyModifier(dependencies: dependencies))
	}
	
}

private struct TemplateDependencyModifier: ViewModifier {
	
	let dependencies: TemplateDependencies
	
	public func body(content: Content) -> some View {
		return dependencies.apply(on: content)
	}
	
}
