import Foundation

struct Account: Codable, Hashable {
  var id: Int
  var client_id: Int
  var name: String
  var balance: Double
  var currency: Currency
  var interest_rate: Double
  var open_date: Date
  var status: AccountStatus
  var type: AccountType

  static let empty = Account(
    id: 0,
    client_id: 0,
    name: "",
    balance: 0,
    currency: .RUB,
    interest_rate: 0.0,
    open_date: .distantPast,
    status: .inactive,
    type: .regular
  )
}

enum AccountStatus: String, CaseIterable, Codable {
  case active = "Active"
  case onValidation = "On validation"
  case frozen = "Frozen"
  case inactive = "Inactive"

  var localized: String {
    switch self {
      case .active: return "Активный"
      case .onValidation: return "На валидации"
      case .frozen: return "Заморожен"
      case .inactive: return "Неактивный"
    }
  }
}

enum AccountType: String, CaseIterable, Codable {
  case regular = "Regular"
  case deposit = "Deposit"
  case charity = "Charity"

  var localized: String {
    switch self {
      case .regular: return "Счет"
      case .deposit: return "Вклад"
      case .charity: return "Благотворительный счет"
    }
  }
}

enum Currency: String, CaseIterable, Codable {
  case RUB = "Russian ruble"
  case USD = "US Dollar"
  case EUR = "Euro"
  case CHF = "Swiss frank"

  var code: String {
    switch self {
      case .RUB: return "RUB"
      case .USD: return "USD"
      case .EUR: return "EUR"
      case .CHF: return "CHF"
    }
  }

  var sign: String {
    switch self {
      case .RUB: return "₽"
      case .USD: return "$"
      case .EUR: return "€"
      case .CHF: return "₣"
    }
  }
}
