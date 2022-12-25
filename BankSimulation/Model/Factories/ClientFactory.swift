import Foundation

final class ClientFactory {
  let appState: AppState

  init(appState: AppState) {
    self.appState = appState
  }

  // no personal manager here!
  func makeClient(
    fullName: String,
    login: String,
    password: String,
    birthday: Date,
    passport: Passport,
    address: String
  ) -> Int {
    var client = Client.empty

    if let last = appState.storage.clients.last {
      client.id = last.id + 1
    } else {
      client.id = 1
    }

    client.full_name = fullName
    client.credentials = CredentialsFactory(appState: appState)
      .makeCredentials(login: login, password: password)
    client.birthday = birthday
    client.passport = passport.id
    client.address = address
    client.is_active = true

    return client.id
  }
}

// var address: String
// var birthday: Date?
// var full_name: String
// var is_active: Bool
// var passport: Int
// var credentials: Int
// var personal_manager: Int
