import Foundation
import PostgresClientKit

enum Page: Hashable {  
//  case loginPage = "Вход"
//  case registrationPage = "Регистрация"
//  case clientPage = "Личный кабинет"
//  case managerPage = "Рабочий кабинет"
//  case adminPage = "Панель администратора"
  case loginPage
  case registrationPage
  case clientPage(client: Client)
  case managerPage(manager: Manager)
  case adminPage(admin: Admin)
}

final class AppState: ObservableObject {
  @Published var page: Page?

  let storage: Storage
  let connection: Connection?

  init(page: Page? = .loginPage) {
    self.page = page
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
