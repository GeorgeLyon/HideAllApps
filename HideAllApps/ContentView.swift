//
//  ContentView.swift
//  HideAllApps
//
//  Created by George Lyon on 3/9/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
  
  @State private var enlarge = false
  @State private var showImmersiveSpace = false
  @State private var immersiveSpaceIsShown = false
  
  @Environment(\.openImmersiveSpace) var openImmersiveSpace
  @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
  
  var body: some View {
    EmptyView()
    .onChange(of: showImmersiveSpace) { _, newValue in
      Task {
        if newValue {
          switch await openImmersiveSpace(id: "ImmersiveSpace") {
          case .opened:
            immersiveSpaceIsShown = true
          case .error, .userCancelled:
            fallthrough
          @unknown default:
            immersiveSpaceIsShown = false
            showImmersiveSpace = false
          }
        } else if immersiveSpaceIsShown {
          await dismissImmersiveSpace()
          immersiveSpaceIsShown = false
        }
      }
    }
    .persistentSystemOverlays(.hidden)
    .toolbar {
      ToolbarItemGroup(placement: .bottomOrnament) {
        VStack (spacing: 12) {
          Toggle("Hide All Apps", isOn: $showImmersiveSpace)
        }
      }
    }
  }
}

#Preview(windowStyle: .volumetric) {
  ContentView()
}
