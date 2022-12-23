import Foundation
import PostgresClientKit

enum AppMode: String, CaseIterable {
  case loginPage = "Login page"
  case manual = "Manual"
}

final class AppState: ObservableObject {
  @Published var appMode: AppMode?

  let storage: Storage
  let connection: Connection?

  init(appMode: AppMode? = .loginPage) {
    self.appMode = appMode
    self.storage = Storage.default
    do {
      self.connection = try Connection(configuration: myConfiguration)
      storage.loadData(with: connection)
    } catch {
      self.connection = nil
      print(error)
    }
  }
}
