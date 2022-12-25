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

  func performLogin(with cr: Credentials) -> (role: Role, id: Int)? {
    do {
      let clientId = try """
        SELECT c.id
        FROM clients c
        INNER JOIN credentials cr ON c.credentials = cr.id
        WHERE cr.login = '\(cr.login)';
        """.executeWithReturn(appState: appState).first?.int()

      let managerId = try """
        SELECT pm.id
        FROM personal_managers pm
        INNER JOIN credentials cr ON pm.credentials = cr.id
        WHERE cr.login = '\(cr.login)';
        """.executeWithReturn(appState: appState).first?.int()

      let adminId = try """
        SELECT a.id
        FROM admin a
        INNER JOIN credentials cr ON a.credentials = cr.id
        WHERE cr.login = '\(cr.login)';
        """.executeWithReturn(appState: appState).first?.int()

      if let clientId {
        return (Role.client, clientId)
      }

      if let managerId {
        return (Role.manager, managerId)
      }

      if let adminId {
        return (Role.admin, adminId)
      }
    } catch {
      print(error)
    }

    return nil
  }

  func getClient(by id: Int) -> Client {
    appState.storage.clients.first { $0.id == id } ?? Client.empty
  }

  func getManager(by id: Int) -> Manager {
    appState.storage.managers.first { $0.id == id } ?? Manager.empty
  }

  func getAdmin(by id: Int) -> Admin {
    appState.storage.admin.first { $0.id == id } ?? Admin.empty
  }
}
