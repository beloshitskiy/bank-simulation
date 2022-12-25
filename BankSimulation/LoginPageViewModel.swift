//
//  LoginPageViewModel.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/20/22.
//

import Foundation
import PostgresClientKit

final class LoginPageViewModel {
  var appState: AppState

  init(appState: AppState) {
    self.appState = appState
  }

  func performClientLogin(with cr: Credentials) -> Client? {
    guard let connection = appState.connection else { return nil }

    let query = """
      SELECT c.id
      FROM clients c
      INNER JOIN credentials cr ON c.credentials = cr.id
      WHERE cr.login = '\(cr.login)';
      """

    do {
      let statement = try connection.prepareStatement(text: query)
      defer { statement.close() }

      let cursor = try statement.execute()
      defer { cursor.close() }

      for row in cursor {
        let clientId = try row.get().columns.first?.int()
        return appState.storage.clients.first { $0.id == clientId }
      }
      
    } catch {
      print(error)
    }
    return nil
  }
}
