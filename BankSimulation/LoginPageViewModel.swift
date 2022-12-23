//
//  LoginPageViewModel.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/20/22.
//

import Foundation

final class LoginPageViewModel: ObservableObject {
  weak var appState: AppState?
  
  func performLogin(with login: String) -> (Bool, Int) {
    // return appState.storage.clients.contains(login)
    return (false, 0)
  }
}
