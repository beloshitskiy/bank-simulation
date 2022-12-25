import Foundation

final class AccountFactory {
  let appState: AppState

  init(appState: AppState) {
    self.appState = appState
  }

  func makeAccount(for clientId: Int, name: String, currency: Currency, type: AccountType) -> Int {
    var account = Account.empty

    if let last = appState.storage.accounts.last {
      account.id = last.id + 1
    } else {
      account.id = 1
    }

    account.client_id = clientId
    account.name = name
    account.currency = currency

    switch currency {
      case .RUB: account.interest_rate = 7.0
      case .USD: account.interest_rate = 3.0
      case .CHF, .EUR: account.interest_rate = 2.0
    }

    account.type = type

    appState.storage.accounts.appendAndStore(account, appState: appState)

    return account.id
  }
}
