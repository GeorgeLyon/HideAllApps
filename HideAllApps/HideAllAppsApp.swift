//
//  HideAllAppsApp.swift
//  HideAllApps
//
//  Created by George Lyon on 3/9/24.
//

import SwiftUI

@main
struct HideAllAppsApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }.windowStyle(.plain)
    
    ImmersiveSpace(id: "ImmersiveSpace") {
      ImmersiveView()
    }
  }
}
