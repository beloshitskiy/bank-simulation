import SwiftUI

@main
struct BankSimulationApp: App {
  var body: some Scene {
    let state = AppState()
    WindowGroup {
      NavigationStack {
        LoginPageView()
          .environmentObject(state)
          .navigationDestination(for: Page.self) { page in
            switch page {
              case .loginPage:
                LoginPageView()
                  .environmentObject(state)

              case .registrationPage:
                SignUpPage()
                  .environmentObject(state)

              case let .clientPage(client):
                ClientPageView(client: client)
                  .environmentObject(state)

              case let .managerPage(manager):
                PersonalManagerPageView(pm: manager)
                  .environmentObject(state)

              case let .adminPage(admin):
                AdminPageView(admin: admin)
                  .environmentObject(state)
            }
          }
      }
    }
  }
}
