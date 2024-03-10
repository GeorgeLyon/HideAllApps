import SwiftUI
import RealityKit

struct ImmersiveView: View {
  var body: some View {
    RealityView { content in
      // Scene is empty
    }
  }
}

#Preview(immersionStyle: .mixed) {
  ImmersiveView()
}
