//
//  LoginPageViewModel.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/20/22.
//

import Foundation
import PostgresClientKit

final class LoginPageViewModel: ObservableObject {
  weak var appState: AppState?

  init(appState: AppState? = nil) {
    self.appState = appState
  }

  // return client
  func performClientLogin(with cr: Credentials) -> Client? {
    guard let appState,
          let ind = appState.storage.credentials
          .first(where: { $0.login == cr.login && $0.password == cr.password })?.credentials_id
    else { return nil }

    return appState.storage.clients.first { $0.credentials == ind }

//    let query = """
//                SELECT c.client_id
//                FROM clients c
//                INNER JOIN credentials cr ON c.credentials = cr.credentials_id
//                WHERE cr.login = 'Hendrix';
//    """
//
//    do {
//      let statement = try connection.prepareStatement(text: query)
//      defer { statement.close() }
//
//      let cursor = try statement.execute()
//      defer { cursor.close() }
//
//      for row in cursor {
//        return try row.get().columns.first?.int()
//      }
//
//    } catch {
//      print(error)
//    }
  }
}
