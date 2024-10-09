//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public extension EnvironmentValues {
	
	/// It's a Binding to allow values to be changed from inside the view hierarchy.
	@Entry var templateStateBinding: Binding<TemplateState> = .constant(TemplateState())

    @Entry var templateState: TemplateState = TemplateState()

}
