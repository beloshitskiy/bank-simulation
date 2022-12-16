import SwiftUI

@main
struct BankSimulationApp: App {
  var body: some Scene {
    let state = AppState()
    WindowGroup {
      ContentView()
        .environmentObject(state)
    }
  }
}
