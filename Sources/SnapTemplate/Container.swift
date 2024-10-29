//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

/// An example implementation of a Container, use this as a base for your views.
struct Container<Content: View>: View {
	
	@ViewBuilder let content: () -> Content
	
	var body: some View {
		content()
	}
	
}

#Preview {
	Container() {
		Text("Test")
	}
}
