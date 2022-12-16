import Foundation

enum AppMode: String, CaseIterable {
  case loginPage = "Login page"
  case manual = "Manual"
}


final class AppState: ObservableObject {
  @Published var appMode: AppMode? = .loginPage
  
  
}
