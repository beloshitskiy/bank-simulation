import Foundation

struct Transaction: Codable, Hashable {
  var id: Int
  var sender_account: Int
  var receiver_account: Int
  var date: Date
  var amount: Double
  var type: TransactionType
  var status: TransactionStatus
  var description: String

  static let empty = Transaction(
    id: 0,
    sender_account: 0,
    receiver_account: 0,
    date: .distantPast,
    amount: 0,
    type: .IC,
    status: .inProgress,
    description: ""
  )
}

enum TransactionType: String, CaseIterable, Codable {
  case ICA = "Inter-client accounts"
  case IC = "Inter-clients"
  case charity = "Charity"

  var localized: String {
    switch self {
      case .ICA: return "Перевод себе"
      case .IC: return "Перевод"
      case .charity: return "Благотворительность"
    }
  }
}

enum TransactionStatus: String, CaseIterable, Codable {
  case confirmed = "Confirmed"
  case inProgress = "In progress"
  case declined = "Declined"

  var localized: String {
    switch self {
      case .confirmed: return "Подтвержден"
      case .inProgress: return "В процессе"
      case .declined: return "Отклонен"
    }
  }
}
