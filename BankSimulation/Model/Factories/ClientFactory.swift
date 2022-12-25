//
//  ClientFactory.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/25/22.
//

import Foundation

import Foundation

final class ClientFactory {
  let appState: AppState?

  init(appState: AppState? = nil) {
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
  ) -> Int? {
    guard let appState else { return nil }

    var client = Client.empty

    if let last = appState.storage.clients.last {
      client.client_id = last.client_id + 1
    } else {
      client.client_id = 1
    }

    client.full_name = fullName
    client.credentials = CredentialsFactory(appState: appState)
      .makeCredentials(login: login, password: password) ?? 0
    client.birthday = birthday
    client.passport = passport.passport_id
    client.address = address
    client.is_active = true

    return client.client_id
  }
}

// var address: String
// var birthday: Date?
// var full_name: String
// var is_active: Bool
// var passport: Int
// var credentials: Int
// var personal_manager: Int
